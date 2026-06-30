#!/usr/bin/env python3
from count_words import word_count
from pathlib import Path

path = Path(__file__).resolve().parent.parent / "Chapters" / "chapter_6.md"
text = path.read_text(encoding="utf-8")
marker = "**PART 2 — KESTREL VEIL POV**"
if marker in text:
    p1, p2 = text.split(marker, 1)
    p2 = marker + p2
else:
    p1, p2 = text, ""

print(f"Ch 6 Part 1 (Dana Holt):     {word_count(p1):,}")
print(f"Ch 6 Part 2 (Kestrel Veil):  {word_count(p2):,}")
print(f"Ch 6 total:                  {word_count(text):,}")
