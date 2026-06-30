#!/usr/bin/env python3
"""Strip author metadata from chapter files; apply publication header format."""
from __future__ import annotations

import re
from pathlib import Path

CHAPTERS_DIR = Path(__file__).resolve().parent.parent / "Chapters"

TITLES: dict[int, str] = {
    1: "The Empire",
    2: "A Captain's Dream",
    3: "The Ship That Refuses to Die",
    4: "Routine Patrol",
    5: "Mission's End",
    6: "First Contact (Anomaly Site Alpha)",
    7: "The Living Ship",
    8: "The Quiet Before the Silence",
    9: "Across the Line",
    10: "The Hunter's Trail",
    11: "Silent Crossings",
    12: "The Watchers",
    13: "Broken Lines",
    14: "Echoes of Passage",
    15: "The First Map",
    16: "Beyond the Line",
    17: "The Listening Post",
    18: "Rules of Engagement",
    19: "First Witness",
    20: "The Weight of Evidence",
    21: "The Long Shadow",
    22: "Recognition",
    23: "The Last Report",
    24: "The Veil Opens",
}

SECTION_RE = re.compile(r"^## SECTION (\d+)\s*[\u2014\-–-]\s*.+$", re.I)
SCENE_RE = re.compile(r"^## Scene \d+\s*[\u2014\-–-]", re.I)
EVENT_RE = re.compile(r"^\*\*Event\s+\d+", re.I)
CODA_RE = re.compile(r"^## (CODA|EPILOGUE)\s*[\u2014\-–-]", re.I)
METADATA_RE = re.compile(
    r"^\*\*(Chapter Number|Title|POV Character|Location|Ship Class|Word Count):\*\*"
)
CHAPTER_HDR_RE = re.compile(r"^#\s*CHAPTER\s+\d+", re.I)
OBJECTIVE_LABEL_RE = re.compile(
    r"^\*\*(Primary Mission Objective|Secondary Constraints|Tertiary Awareness|Operational Objective)",
    re.I,
)
PLACEHOLDER_MARKERS = (
    "*(Chapter not yet written",
    "**Purpose:**",
    "This chapter establishes",
    "Readers should begin",
    "The chapter should leave",
)


def is_placeholder_body_line(line: str, chapter_num: int) -> bool:
    if chapter_num not in (2, 3, 4):
        return False
    stripped = line.strip()
    if not stripped:
        return False
    if any(stripped.startswith(m) for m in PLACEHOLDER_MARKERS):
        return True
    if stripped.startswith("- "):
        return True
    if stripped.startswith("See `Act_Outlines"):
        return True
    return False


def skip_objective_meta_line(line: str) -> bool:
    stripped = line.strip()
    if not stripped:
        return True
    if stripped == "---":
        return True
    if OBJECTIVE_LABEL_RE.match(stripped):
        return True
    if stripped.startswith("- ") and not stripped.startswith('- "'):
        return True
    return False


def extract_body(lines: list[str], chapter_num: int) -> list[str]:
    """Return narrative lines with development artifacts removed."""
    start = 0
    for i, line in enumerate(lines):
        if CHAPTER_HDR_RE.match(line):
            continue
        if METADATA_RE.match(line):
            continue
        if line.strip() == "---" and start == 0:
            start = i + 1
            continue
        if start > 0 or (line.strip() and not line.startswith("#") and not METADATA_RE.match(line)):
            if start == 0:
                start = i
            break

    out: list[str] = []
    skip_mode: str | None = None  # section_2, section_4, section_5

    i = start
    while i < len(lines):
        line = lines[i]

        if METADATA_RE.match(line):
            i += 1
            continue

        if is_placeholder_body_line(line, chapter_num):
            i += 1
            continue

        sec = SECTION_RE.match(line)
        if sec:
            n = int(sec.group(1))
            if n == 6:
                break
            if n == 2:
                skip_mode = "section_2"
                i += 1
                continue
            if n in (4, 5):
                skip_mode = f"section_{n}"
                i += 1
                continue
            skip_mode = None
            i += 1
            continue

        if skip_mode == "section_2":
            if SECTION_RE.match(line) or CODA_RE.match(line):
                skip_mode = None
                if CODA_RE.match(line):
                    i += 1
                    continue
                continue
            if skip_objective_meta_line(line):
                i += 1
                continue
            skip_mode = None

        if skip_mode in ("section_4", "section_5"):
            if SECTION_RE.match(line) or CODA_RE.match(line):
                skip_mode = None
                if CODA_RE.match(line):
                    i += 1
                    continue
                continue
            i += 1
            continue

        if SCENE_RE.match(line) or EVENT_RE.match(line):
            i += 1
            continue

        if CODA_RE.match(line):
            i += 1
            continue

        out.append(line)
        i += 1

    while out and not out[-1].strip():
        out.pop()
    while out and out[-1].strip() == "---":
        out.pop()
        while out and not out[-1].strip():
            out.pop()

    return out


def publication_header(chapter_num: int) -> str:
    title = TITLES[chapter_num]
    return f"# Chapter {chapter_num}\n\n## {title}\n\n❦\n"


def cleanup_chapter(chapter_num: int) -> str:
    path = CHAPTERS_DIR / f"chapter_{chapter_num}.md"
    raw = path.read_text(encoding="utf-8")
    lines = raw.splitlines()
    body = extract_body(lines, chapter_num)

    header = publication_header(chapter_num)
    if not body or all(not ln.strip() for ln in body):
        return header + "\n"

    return header + "\n" + "\n".join(body).rstrip() + "\n"


def main() -> None:
    for n in range(1, 25):
        out = cleanup_chapter(n)
        path = CHAPTERS_DIR / f"chapter_{n}.md"
        path.write_text(out, encoding="utf-8", newline="\n")
        print(f"cleaned chapter_{n}.md ({len(out.split())} words)")


if __name__ == "__main__":
    main()
