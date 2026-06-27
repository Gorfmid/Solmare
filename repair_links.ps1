# Repair internal markdown links after repository restructure
$RepoRoot = "c:\Users\gorfm\Documents\projects\Solmare-Quadrant"
$replacements = @(
    @('Bible/book_structure/act2_chapters_6-10_generation.md', 'Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/act2_chapters_6-11_generation.md'),
    @('Bible/book_structure/', 'Books/Book_01_The_Kestrel_Veil_Incident/Act_Outlines/'),
    @('Bible/characters/relationship_matrix.md', 'Characters/Relationship_Matrix/relationship_matrix.md'),
    @('Bible/characters/support_crew.md', 'Characters/Support_Crew/support_crew.md'),
    @('Bible/characters/Steve.md', 'Characters/Recurring/Steve.md'),
    @('Bible/characters/ensemble_design.md', 'Characters/Primary_Crew/ensemble_design.md'),
    @('Bible/characters/crew_culture.md', 'Characters/Primary_Crew/crew_culture.md'),
    @('Bible/characters/crew_gravity.md', 'Characters/Primary_Crew/crew_gravity.md'),
    @('Bible/characters/crew_roles.md', 'Characters/Primary_Crew/crew_roles.md'),
    @('Bible/characters/Calder_Venn.md', 'Characters/Primary_Crew/Calder_Venn.md'),
    @('Bible/characters/Mira_Thessaly.md', 'Characters/Primary_Crew/Mira_Thessaly.md'),
    @('Bible/characters/Damon_Reyes.md', 'Characters/Primary_Crew/Damon_Reyes.md'),
    @('Bible/characters/Elara_Koss.md', 'Characters/Primary_Crew/Elara_Koss.md'),
    @('Bible/characters/Jun_Park.md', 'Characters/Primary_Crew/Jun_Park.md'),
    @('Bible/characters/Ari_Halden.md', 'Characters/Primary_Crew/Ari_Halden.md'),
    @('Bible/characters/', 'Characters/Primary_Crew/'),
    @('Bible/series_principles.md', 'Writing_System/Series_Principles/series_principles.md'),
    @('Bible/world/systems.md', 'Universe/Cosmology/systems.md'),
    @('Bible/world/galaxy.md', 'Universe/Cosmology/galaxy.md'),
    @('Bible/world/solmare_quadrant.md', 'Universe/Maps/solmare_quadrant.md'),
    @('Bible/world/sector.md', 'Universe/Maps/sector.md'),
    @('Bible/world/', 'Universe/Maps/'),
    @('Bible/empires/', 'Universe/Fleet/'),
    @('Bible/Ships/Classes/scout_class.md', 'Universe/Technology/scout_class.md'),
    @('Bible/Ships/Instances/kestrel_veil.md', 'Books/Book_01_The_Kestrel_Veil_Incident/Notes/kestrel_veil.md'),
    @('Bible/README.md', 'Universe/README_legacy_bible_index.md'),
    @('Bible/', 'Universe/'),
    @('../../Style/the_70_30_rule.md', '../../../Writing_System/Style_Guide/the_70_30_rule.md'),
    @('../../State/current_state.md', '../State/current_state.md'),
    @('../series_principles.md', '../../../Writing_System/Series_Principles/series_principles.md'),
    @('Style/the_70_30_rule.md', 'Writing_System/Style_Guide/the_70_30_rule.md'),
    @('Style/pacing_rules.md', 'Writing_System/Style_Guide/pacing_rules.md'),
    @('Style/dialogue_rules.md', 'Writing_System/Style_Guide/dialogue_rules.md'),
    @('Style/', 'Writing_System/Style_Guide/'),
    @('Engine/', 'Writing_System/Generation_Rules/'),
    @('orchestrator/MASTER_ORCHESTRATOR_PROMPT.md', 'Writing_System/Orchestrator/MASTER_ORCHESTRATOR_PROMPT.md'),
    @('/orchestrator/MASTER_ORCHESTRATOR_PROMPT.md', '/Writing_System/Orchestrator/MASTER_ORCHESTRATOR_PROMPT.md'),
    @('orchestrator/', 'Writing_System/Orchestrator/'),
    @('State/current_state.md', 'Books/Book_01_The_Kestrel_Veil_Incident/State/current_state.md'),
    @('State/', 'Books/Book_01_The_Kestrel_Veil_Incident/State/'),
    @('chapters/chapter_', 'Books/Book_01_The_Kestrel_Veil_Incident/Chapters/chapter_'),
    @('/chapters/chapter_', '/Books/Book_01_The_Kestrel_Veil_Incident/Chapters/chapter_'),
    @('../chapters/', '../Chapters/'),
    @('manuscript/', 'Books/Book_01_The_Kestrel_Veil_Incident/Manuscript/'),
    @('The Kestrel Veil Incident/chapters/', 'Books/Book_01_The_Kestrel_Veil_Incident/Chapters/'),
    @('The Kestrel Veil Incident/State/', 'Books/Book_01_The_Kestrel_Veil_Incident/State/'),
    @('The Kestrel Veil Incident/manuscript/', 'Books/Book_01_The_Kestrel_Veil_Incident/Manuscript/'),
    @('The Kestrel Veil Incident/Bible/', 'Universe/'),
    @('The Kestrel Veil Incident/Engine/', 'Writing_System/Generation_Rules/'),
    @('The Kestrel Veil Incident/Style/', 'Writing_System/Style_Guide/'),
    @('The Kestrel Veil Incident/orchestrator/', 'Writing_System/Orchestrator/')
)

$fixed = @()
$files = Get-ChildItem $RepoRoot -Recurse -File -Include *.md | Where-Object {
    $_.FullName -notmatch 'restructure_|repair_links'
}

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    if (-not $content) { continue }
    $original = $content
    foreach ($pair in $replacements) {
        $content = $content.Replace($pair[0], $pair[1])
    }
    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($true))
        $fixed += $file.FullName.Replace("$RepoRoot\", '')
    }
}

$fixed | Set-Content (Join-Path $RepoRoot "restructure_links_fixed.txt") -Encoding UTF8
Write-Host "Updated $($fixed.Count) markdown files"

# Scan for likely broken legacy paths
$patterns = @('Bible/', 'The Kestrel Veil Incident/', '../Style/', '../../Style/', 'Engine/', '`Style/', 'orchestrator/', 'chapters/chapter_', '../chapters/chapter_01')
$broken = @()
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    foreach ($p in $patterns) {
        if ($content -match [regex]::Escape($p)) {
            $broken += "$($file.FullName.Replace("$RepoRoot\", '')): $p"
        }
    }
}
$broken | Select-Object -Unique | Set-Content (Join-Path $RepoRoot "restructure_links_remaining.txt") -Encoding UTF8
Write-Host "Remaining legacy path hits: $(($broken | Select-Object -Unique).Count)"
