#!/usr/bin/env python3
"""Fleet Systems Lexicon terminology pass for Book One manuscript sources.

Canonical rules: Writing_System/Style_Guide/fleet_systems_lexicon.md
"""

from __future__ import annotations

import re
from pathlib import Path

BOOK_ROOT = Path(__file__).resolve().parents[1]

# Longest-first phrase replacements (defensive / tactical)
DEFENSIVE_REPLACEMENTS: list[tuple[str, str]] = [
    ("Scout defensive failure modes", "Scout combat-system failure modes"),
    ("scout defensive failure modes", "scout combat-system failure modes"),
    ("scout defensive suites", "scout tactical systems"),
    ("defensive suites prioritized", "tactical systems prioritized"),
    ("defensive suite calibration", "tactical systems calibration"),
    ("Defensive suite won't", "Tactical systems won't"),
    ("defensive suite won't", "tactical systems won't"),
    ("Defensive suite registering", "Tactical systems registering"),
    ("defensive suite registering", "tactical systems registering"),
    ("Defensive suite sees", "Tactical systems see"),
    ("defensive suite sees", "tactical systems see"),
    ("Defensive suite—", "Tactical systems—"),
    ("defensive suite—", "tactical systems—"),
    ("Defensive suite", "Tactical systems"),
    ("defensive suite", "tactical systems"),
    ("defensive suites", "tactical systems"),
    ("Port defensive suite", "Port tactical array"),
    ("defensive systems technician", "tactical systems technician"),
    ("from defensive systems nook", "from tactical systems nook"),
    ("defensive systems nook", "tactical systems nook"),
    ("defensive systems feed", "tactical systems feed"),
    ("stood at defensive systems", "stood at tactical systems"),
    ("at defensive systems", "at tactical systems"),
    ("defensive systems", "tactical systems"),
    ("defensive tie-in", "tactical tie-in"),
    ("Defensive emitters", "Tactical emitters"),
    ("defensive emitters", "tactical emitters"),
    ("defensive equipment an*optional", "tactical systems equipment an *optional"),
    ("defensive equipment", "tactical systems equipment"),
    ("full defensive rotation", "full tactical watch rotation"),
    ("on defensive watch", "on tactical watch"),
    ("at the defensive post", "at the tactical watch"),
    ("her defensive post", "her tactical watch"),
    ("defensive post", "tactical watch"),
    ("**Marcus Hale** from defensive,", "**Marcus Hale** from tactical,"),
    ("**Ari Halden** on defensive:", "**Ari Halden** on tactical:"),
    ("Hale on defensive:", "Hale on tactical:"),
    ("Hale at defensive:", "Hale at tactical:"),
    ("Hale from defensive:", "Hale from tactical:"),
    ("from defensive,", "from tactical,"),
    ("from defensive:", "from tactical:"),
    ("on defensive:", "on tactical:"),
    ("said from defensive", "said from tactical"),
    ("sat at defensive", "sat at tactical"),
    ("returned to defensive", "returned to tactical"),
    ("Hale from defensive", "Hale from tactical"),
    ("priority for defensive and engineering", "priority for tactical and engineering"),
    ("Defensive training", "Combat systems training"),
    ("spoke for defensive suites", "spoke for tactical systems"),
    ("Hale at defensive did not leave", "Hale at tactical did not leave"),
    ("Hale at defensive with", "Hale at tactical with"),
    ("not left defensive", "not left tactical"),
    ("listen in defensive when", "monitor on tactical when"),
    ("stayed on defensive with", "stayed on tactical with"),
    ("the defensive console", "the tactical console"),
    ("calling defensive *optional", "calling tactical systems *optional"),
    ("knew the suite the way", "knew the systems the way"),
    ("because the suite wouldn't wait", "because the systems wouldn't wait"),
    ("because the suite felt", "because the systems felt"),
]

SUITE_REPLACEMENTS: list[tuple[str, str]] = [
    ("navigation suite", "navigation station"),
    ("Passive suite dwell", "Passive systems dwell"),
    ("passive suite dwell", "passive systems dwell"),
    ('"Passive suite stable,"', '"Passive systems stable,"'),
    ("passive suite stable", "passive systems stable"),
    ("passive suite rebuilt", "passive systems rebuilt"),
    ("the passive suite was still dead", "the passive systems were still dead"),
    ("Passive suites logged", "Passive systems logged"),
    ("passive suites logged", "passive systems logged"),
    ("passive suites were not designed", "passive systems were not designed"),
    ("scout-class passive suite", "scout-class passive systems"),
    ("scout's passive suite", "scout's passive systems"),
    ("Scout-class suite,", "Scout-class passive systems,"),
    ("suite generations", "sensor platform generations"),
    ("older suites", "older systems"),
    ("backup suite", "backup array"),
    ("no active suite had confirmed", "no active systems had confirmed"),
    ("before suite saw", "before systems saw"),
    ("before the suite does", "before the systems do"),
    ("when the suite spits", "when the systems spit"),
    ("rewiring a suite that thought", "rewiring tactical systems that thought"),
    ("her own suite at", "her own systems at"),
    ('"Suite can\'t answer', '"Systems can\'t answer'),
    ("Thermal suite:", "Thermal systems:"),
    ("Thermal suite returned", "Thermal systems returned"),
    ("The passive suite was still dead", "The passive systems were still dead"),
    ("single-suite passive coverage", "single-system passive coverage"),
    ("diagnostic suite", "diagnostics stack"),
    ("analysis suite", "analysis stack"),
    ("comms suite", "communications stack"),
    ("sensor suite", "sensor systems"),
]

# Fleet Systems Lexicon v1.0 — VI-Gamma, sensor language, stack terms
LEXICON_REPLACEMENTS: list[tuple[str, str]] = [
    ("did not arrive at Kestran VI-Gamma so much as", "did not match drift into Kestran VI-Gamma watchpost berthing so much as"),
    ("VI-Gamma's emergency berthing ring was", "The watchpost berthing ring at Kestran VI-Gamma was"),
    ("leave VI-Gamma range", "leave VI-Gamma relay coverage"),
    ("logged them out of VI-Gamma relay range", "logged them out of VI-Gamma relay coverage"),
    ("since VI-Gamma went static", "since the VI-Gamma relay went static"),
    ("VI-Gamma's warm voice", "the VI-Gamma relay voice"),
    ("VI-Gamma's flat returns", "VI-Gamma passive returns"),
    ("no action at VI-Gamma", "no action on VI-Gamma relay path"),
    ("On VI-Gamma, Holt and Nand", "At the Kestran VI-Gamma watchpost, Holt and Nand"),
    ("at her VI-Gamma console", "at her watchpost console"),
    ("The chain that had begun at VI-Gamma with", "The chain that had begun on the VI-Gamma relay path with"),
    ("Holt had held the chain on VI-Gamma", "Holt had held the chain on the VI-Gamma relay path"),
    ("Holt had started on VI-Gamma believing", "Holt had started on the Kestran VI-Gamma watchpost believing"),
    ("pulled from VI-Gamma secondary watch", "pulled from the Kestran VI-Gamma watchpost secondary watch"),
    ("at three in the morning on VI-Gamma", "at three in the morning on a VI-Gamma watch"),
    ('"VI-Gamma node?"', '"VI-Gamma relay node?"'),
    ('"VI-Gamma. Approach lane two.', '"VI-Gamma watchpost. Approach lane two.'),
    ("Koss confirmed tactical tie-in saw", "Koss verified tactical tie-in registered"),
    ("Hale confirmed optical interval steady", "Hale logged optical interval steady"),
    ("Optical: silhouette-scale presence, confirmed, holding", "Optical: silhouette-scale presence, holding"),
    ("Holt confirms sensor cross-check", "Holt validates sensor cross-check"),
    ('"Passive lock confirmed,"', '"Passive lock held,"'),
    ("Halden: \"Tactical lock confirmed.\"", "Halden: \"Tactical lock held.\""),
    ("Reyes: \"Navigation lock confirmed.\"", "Reyes: \"Navigation lock held.\""),
]

PROTECTED_PATTERNS = [
    r"honor suite",
    r"translation suites",
    r"defensive discharge",
    r"defensive withdrawal",
    r"defensive readiness",
    r"defensive planning",
    r"Intelligence defensive",
    r"defended it",
    r"defensive posture",
]

GRAMMAR_FIXES: list[tuple[str, str]] = [
    ("tactical systems sees", "tactical systems see"),
    ("Tactical systems sees", "Tactical systems see"),
    ("the passive systems was", "the passive systems were"),
    ("spoke for tactical systemss", "spoke for tactical systems"),
]

# Personnel posting language — expand shorthand "on/from/at tactical" to "tactical watch"
# Excludes system-layer phrases (onto tactical, lag on tactical, from tactical discharge, etc.)
PERSONNEL_REGEX: list[tuple[str, str]] = [
    (r"\*\*Marcus Hale\*\* from tactical,", "**Marcus Hale**, tactical watch,"),
    (r"\*\*Ari Halden\*\* on tactical:", "**Ari Halden**, tactical watch:"),
    (r"\bHalden did not look up from tactical until\b", "Halden did not look up from tactical watch until"),
    (r"\bHalden said from tactical secondary\b", "Halden said from tactical watch secondary"),
    (r"\bHalden said from tactical\.", "Halden said from tactical watch."),
    (r"\bHalden, from tactical:", "Halden, tactical watch:"),
    (r"\bHalden from tactical, dry:", "Halden, tactical watch, dry:"),
    (r"\bdelayed four seconds on tactical,", "delayed four seconds on tactical watch,"),
    (r"\breturned to tactical without\b", "returned to tactical watch without"),
    (r"\bsat at tactical with\b", "sat at tactical watch with"),
    (r", Hale from tactical,", ", Hale from tactical watch,"),
    (r"\bHale from tactical:", "Hale, tactical watch:"),
    (r"\bHale at tactical:", "Hale, tactical watch:"),
    (r"\bHale on tactical:", "Hale, tactical watch:"),
    (r"\bConfirm from tactical\.", "Confirm from tactical watch."),
]


def apply_personnel_posting(text: str) -> tuple[str, int]:
    changes = 0
    for pattern, repl in PERSONNEL_REGEX:
        updated, n = re.subn(pattern, repl, text)
        if n:
            text = updated
            changes += n
    return text, changes


def apply_replacements(text: str) -> tuple[str, int]:
    changes = 0

    def protected_span(start: int, end: int, original: str) -> bool:
        snippet = original[start:end].lower()
        return any(re.search(p, snippet) for p in PROTECTED_PATTERNS)

    for old, new in DEFENSIVE_REPLACEMENTS + SUITE_REPLACEMENTS + LEXICON_REPLACEMENTS:
        if old not in text:
            continue
        parts: list[str] = []
        last = 0
        local = 0
        for m in re.finditer(re.escape(old), text):
            if protected_span(m.start(), m.end(), text):
                parts.append(text[last : m.end()])
            else:
                parts.append(text[last : m.start()])
                parts.append(new)
                local += 1
            last = m.end()
        parts.append(text[last:])
        if local:
            text = "".join(parts)
            changes += local

    for old, new in GRAMMAR_FIXES:
        count = text.count(old)
        if count:
            text = text.replace(old, new)
            changes += count

    text, personnel_changes = apply_personnel_posting(text)
    changes += personnel_changes

    return text, changes


def process_file(path: Path) -> int:
    original = path.read_text(encoding="utf-8")
    updated, changes = apply_replacements(original)
    if changes and updated != original:
        path.write_text(updated, encoding="utf-8", newline="\n")
    return changes


def main() -> None:
    targets: list[Path] = []
    chapters = BOOK_ROOT.parent / "Chapters"
    targets.extend(sorted(chapters.glob("*.md")))
    targets.extend(sorted(BOOK_ROOT.glob("Act_*.md")))
    full_ms = BOOK_ROOT / "The Kestrel Veil Incident.md"
    if full_ms.exists():
        targets.append(full_ms)

    ship_bible = BOOK_ROOT.parent / "Ships" / "Kestrel_Veil.md"
    if ship_bible.exists():
        targets.append(ship_bible)

    total = 0
    for path in targets:
        n = process_file(path)
        if n:
            print(f"{path.name}: {n} replacements")
            total += n
    print(f"Done. {total} total replacements across {len(targets)} files.")


if __name__ == "__main__":
    main()
