import pathlib

root = pathlib.Path(r"Books/Book_01_The_Kestrel_Veil_Incident/Chapters")
files = [
    "chapter_3.md", "chapter_5.md", "chapter_6.md", "chapter_7.md", "chapter_8.md",
    "chapter_15.md", "chapter_17.md", "chapter_18.md", "chapter_19.md",
    "chapter_21.md", "chapter_22.md", "chapter_24.md",
]

for name in files:
    p = root / name
    t = p.read_text(encoding="utf-8")
    if "\ufffd" not in t:
        print("ok", name)
        continue
    t2 = t.replace("\ufffd", "—")
    p.write_text(t2, encoding="utf-8", newline="\n")
    print("fixed", name, t.count("\ufffd"))
