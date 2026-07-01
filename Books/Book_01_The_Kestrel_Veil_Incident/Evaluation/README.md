# AI Evaluation Exports

Generated for upload to Gemini or similar tools.

Gemini accepts PDF and plain text (.txt). It does not accept EPUB or DOCX for document analysis.

- The_Kestrel_Veil_Incident_Book_One_Full.txt - complete book (108491 words)
- Part_01_Prologue_and_Chapters_1-8.txt
- Part_02_Chapters_9-16.txt
- Part_03_Chapters_17-24_and_Epilogue.txt

For a full-manuscript critique, upload Part 1, evaluate, then continue with Parts 2-3.

Regenerate: powershell -ExecutionPolicy Bypass -File .\export_for_evaluation.ps1

Print PDF: run build_manuscript.ps1 on a machine with Microsoft Word installed.
