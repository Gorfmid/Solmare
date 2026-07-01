#!/usr/bin/env python3
"""Count words per chapter (excludes headers and HTML comments)."""
from __future__ import annotations

import re
from pathlib import Path

CHAPTERS_DIR = Path(__file__).resolve().parent.parent / "Chapters"


def word_count(text: str) -> int:
    lines = []
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("<!--") or s.startswith("#") or s in ("\u2766", "\u2746", "\u2746"):
            continue
        lines.append(line)
    body = "\n".join(lines)
    return len(re.findall(r"[\w']+", body, re.UNICODE))


def main() -> None:
    rows: list[tuple[int, int, int]] = []
    total = 0
    for n in range(1, 25):
        path = CHAPTERS_DIR / f"chapter_{n}.md"
        if not path.exists():
            continue
        text = path.read_text(encoding="utf-8")
        wc = word_count(text)
        total += wc
        rows.append((n, wc, path.stat().st_size))

    print(f"{'Ch':>3}  {'Words':>7}  {'Bytes':>8}")
    print("-" * 24)
    for n, wc, sz in rows:
        flag = " (shell)" if wc < 50 else ""
        print(f"{n:3d}  {wc:7,d}  {sz:8,d}{flag}")
    print("-" * 24)
    ch1_5 = sum(w for n, w, _ in rows if n <= 5)
    print(f"Ch 1-5 total:     {ch1_5:,}")
    print(f"Ch 6-24 (shells): {sum(w for n, w, _ in rows if n >= 6):,}")
    print(f"All files 1-24:   {total:,}")


if __name__ == "__main__":
    main()
