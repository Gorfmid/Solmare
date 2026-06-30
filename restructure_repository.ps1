# Restructure Solmare-Quadrant into universe/series layout
$ErrorActionPreference = "Stop"
$RepoRoot = "c:\Users\gorfm\Documents\projects\Solmare-Quadrant"
$Src = Join-Path $RepoRoot "The Kestrel Veil Incident"
$Book1 = Join-Path $RepoRoot "Books\Book_01_The_Kestrel_Veil_Incident"

Set-Location $RepoRoot

function Ensure-Dir($path) {
    if (-not (Test-Path $path)) { New-Item -ItemType Directory -Path $path -Force | Out-Null }
}

function Move-ItemSafe($from, $to) {
    if (-not (Test-Path $from)) { Write-Warning "Missing: $from"; return $false }
    Ensure-Dir (Split-Path $to -Parent)
    if (Test-Path $to) { throw "Destination exists: $to" }
    $prevEap = $ErrorActionPreference
    $ErrorActionPreference = 'SilentlyContinue'
    & git mv -- $from $to 2>$null | Out-Null
    $ErrorActionPreference = $prevEap
    if (-not (Test-Path $to)) {
        Move-Item -Path $from -Destination $to -Force
    }
    return $true
}

# Top-level folders
$dirs = @(
    "Universe\Cosmology", "Universe\Technology", "Universe\Fold", "Universe\Library",
    "Universe\Observation_Doctrine", "Universe\Fleet", "Universe\Interior_Mandate",
    "Universe\KISC_KISU", "Universe\Civilian_Factions", "Universe\Timeline", "Universe\Maps",
    "Characters\Primary_Crew", "Characters\Support_Crew", "Characters\Recurring", "Characters\Relationship_Matrix",
    "Writing_System\Generation_Rules", "Writing_System\Style_Guide", "Writing_System\Series_Principles",
    "Writing_System\Character_Generation", "Writing_System\Review_Checklists", "Writing_System\Prompts", "Writing_System\Orchestrator",
    "Books\Book_01_The_Kestrel_Veil_Incident\Act_Outlines",
    "Books\Book_01_The_Kestrel_Veil_Incident\State",
    "Books\Book_01_The_Kestrel_Veil_Incident\Notes",
    "Books\Book_01_The_Kestrel_Veil_Incident\Cover",
    "Books\Book_01_The_Kestrel_Veil_Incident\Archive",
    "Books\Book_02", "Books\Book_03", "Books\Book_04",
    "Publishing\Amazon_KDP", "Publishing\Cover_Assets", "Publishing\Author_Bio",
    "Publishing\Keywords_and_Categories", "Publishing\Marketing_Copy",
    "Research\Science", "Research\Military_Doctrine", "Research\Publishing", "Research\Notes"
)
foreach ($d in $dirs) { Ensure-Dir (Join-Path $RepoRoot $d) }

$moves = @(
    # Book One — whole directories
    @("$Src\chapters", "$Book1\Chapters", "wholedir"),
    @("$Src\manuscript", "$Book1\Manuscript", "wholedir"),
    # Book One — State (book-specific logs)
    @("$Src\State\current_state.md", "$Book1\State\current_state.md", "file"),
    @("$Src\State\chapter_1_state_log.md", "$Book1\State\chapter_1_state_log.md", "file"),
    @("$Src\State\chapter_2_state_log.md", "$Book1\State\chapter_2_state_log.md", "file"),
    @("$Src\State\chapter_3_state_log.md", "$Book1\State\chapter_3_state_log.md", "file"),
    @("$Src\State\chapter_4_state_log.md", "$Book1\State\chapter_4_state_log.md", "file"),
    @("$Src\State\chapter_5_state_log.md", "$Book1\State\chapter_5_state_log.md", "file"),
    # Cover asset (copy from manuscript after move)
    @("$Book1\Manuscript\cover.svg", "$Book1\Cover\cover.svg", "file-copy"),
    # Act outlines
    @("$Src\Bible\book_structure\act2_chapters_6-11_generation.md", "$Book1\Act_Outlines\act2_chapters_6-11_generation.md", "file"),
    @("$Src\Bible\book_structure\act3_chapters_12-18_generation.md", "$Book1\Act_Outlines\act3_chapters_12-18_generation.md", "file"),
    @("$Src\Bible\book_structure\act4_chapters_19-24_generation.md", "$Book1\Act_Outlines\act4_chapters_19-24_generation.md", "file"),
    @("$Src\Bible\book_structure\chapter_11_generation_directive.md", "$Book1\Act_Outlines\chapter_11_generation_directive.md", "file"),
    @("$Src\Bible\book_structure\chapter_list.md", "$Book1\Act_Outlines\chapter_list.md", "file"),
    # Book One notes
    @("$Src\Bible\book_structure\book1_core_premise.md", "$Book1\Notes\book1_core_premise.md", "file"),
    @("$Src\Bible\book_structure\book1_outline.md", "$Book1\Notes\book1_outline.md", "file"),
    @("$Src\Bible\book_structure\chapter_skeleton.md", "$Book1\Notes\chapter_skeleton.md", "file"),
    @("$Src\Bible\book_structure\mystery_spine.md", "$Book1\Notes\mystery_spine.md", "file"),
    @("$Src\Bible\Ships\Instances\kestrel_veil.md", "$Book1\Notes\kestrel_veil.md", "file"),
    @("$Src\To do", "$Book1\Notes\To_do", "file"),
    @("$Src\Untitled", "$Book1\Notes\Untitled", "file"),
    # Characters — Primary
    @("$Src\Bible\characters\Calder_Venn.md", "$RepoRoot\Characters\Primary_Crew\Calder_Venn.md", "file"),
    @("$Src\Bible\characters\Mira_Thessaly.md", "$RepoRoot\Characters\Primary_Crew\Mira_Thessaly.md", "file"),
    @("$Src\Bible\characters\Damon_Reyes.md", "$RepoRoot\Characters\Primary_Crew\Damon_Reyes.md", "file"),
    @("$Src\Bible\characters\Elara_Koss.md", "$RepoRoot\Characters\Primary_Crew\Elara_Koss.md", "file"),
    @("$Src\Bible\characters\Jun_Park.md", "$RepoRoot\Characters\Primary_Crew\Jun_Park.md", "file"),
    @("$Src\Bible\characters\Ari_Halden.md", "$RepoRoot\Characters\Primary_Crew\Ari_Halden.md", "file"),
    @("$Src\Bible\characters\ensemble_design.md", "$RepoRoot\Characters\Primary_Crew\ensemble_design.md", "file"),
    @("$Src\Bible\characters\crew_culture.md", "$RepoRoot\Characters\Primary_Crew\crew_culture.md", "file"),
    @("$Src\Bible\characters\crew_gravity.md", "$RepoRoot\Characters\Primary_Crew\crew_gravity.md", "file"),
    @("$Src\Bible\characters\crew_roles.md", "$RepoRoot\Characters\Primary_Crew\crew_roles.md", "file"),
    @("$Src\Bible\characters\support_crew.md", "$RepoRoot\Characters\Support_Crew\support_crew.md", "file"),
    @("$Src\Bible\characters\Kevin.md", "$RepoRoot\Characters\Recurring\Kevin.md", "file"),
    @("$Src\Bible\characters\relationship_matrix.md", "$RepoRoot\Characters\Relationship_Matrix\relationship_matrix.md", "file"),
    # Universe
    @("$Src\Bible\world\galaxy.md", "$RepoRoot\Universe\Cosmology\galaxy.md", "file"),
    @("$Src\Bible\world\systems.md", "$RepoRoot\Universe\Cosmology\systems.md", "file"),
    @("$Src\Bible\world\sector.md", "$RepoRoot\Universe\Maps\sector.md", "file"),
    @("$Src\Bible\world\solmare_quadrant.md", "$RepoRoot\Universe\Maps\solmare_quadrant.md", "file"),
    @("$Src\Bible\empires\unified_fleet_authority.md", "$RepoRoot\Universe\Fleet\unified_fleet_authority.md", "file"),
    @("$Src\Bible\empires\relations.md", "$RepoRoot\Universe\Fleet\relations.md", "file"),
    @("$Src\Bible\Ships\Classes\scout_class.md", "$RepoRoot\Universe\Technology\scout_class.md", "file"),
    @("$Src\State\anomaly_stage_definition.md", "$RepoRoot\Universe\Observation_Doctrine\anomaly_stage_definition.md", "file"),
    # Writing System
    @("$Src\Bible\series_principles.md", "$RepoRoot\Writing_System\Series_Principles\series_principles.md", "file"),
    @("$Src\Engine\auto_regen_loop.md", "$RepoRoot\Writing_System\Generation_Rules\auto_regen_loop.md", "file"),
    @("$Src\Engine\book_runtime_loop.md", "$RepoRoot\Writing_System\Generation_Rules\book_runtime_loop.md", "file"),
    @("$Src\Engine\canon_priority_rule.md", "$RepoRoot\Writing_System\Generation_Rules\canon_priority_rule.md", "file"),
    @("$Src\Engine\chapter_generator_spec.md", "$RepoRoot\Writing_System\Generation_Rules\chapter_generator_spec.md", "file"),
    @("$Src\Engine\chapter_refinement_engine.md", "$RepoRoot\Writing_System\Generation_Rules\chapter_refinement_engine.md", "file"),
    @("$Src\Engine\chapter_validator.md", "$RepoRoot\Writing_System\Generation_Rules\chapter_validator.md", "file"),
    @("$Src\Engine\class_instance_rules.md", "$RepoRoot\Writing_System\Generation_Rules\class_instance_rules.md", "file"),
    @("$Src\Engine\continuity_rules.md", "$RepoRoot\Writing_System\Generation_Rules\continuity_rules.md", "file"),
    @("$Src\Engine\discovery_constraint.md", "$RepoRoot\Writing_System\Generation_Rules\discovery_constraint.md", "file"),
    @("$Src\Engine\output_format_contract.md", "$RepoRoot\Writing_System\Generation_Rules\output_format_contract.md", "file"),
    @("$Src\Engine\special_entities_rules.md", "$RepoRoot\Writing_System\Generation_Rules\special_entities_rules.md", "file"),
    @("$Src\Engine\truth_hierarchy_rule.md", "$RepoRoot\Writing_System\Generation_Rules\truth_hierarchy_rule.md", "file"),
    @("$Src\State\state_schema.md", "$RepoRoot\Writing_System\Generation_Rules\state_schema.md", "file"),
    @("$Src\State\state_update_rules.md", "$RepoRoot\Writing_System\Generation_Rules\state_update_rules.md", "file"),
    @("$Src\State\state_integration_engine.md", "$RepoRoot\Writing_System\Generation_Rules\state_integration_engine.md", "file"),
    @("$Src\State\chapter_state_log_template.md", "$RepoRoot\Writing_System\Generation_Rules\chapter_state_log_template.md", "file"),
    @("$Src\Style\dialogue_rules.md", "$RepoRoot\Writing_System\Style_Guide\dialogue_rules.md", "file"),
    @("$Src\Style\forbidden_styles.md", "$RepoRoot\Writing_System\Style_Guide\forbidden_styles.md", "file"),
    @("$Src\Style\narrative_voice.md", "$RepoRoot\Writing_System\Style_Guide\narrative_voice.md", "file"),
    @("$Src\Style\pacing_rules.md", "$RepoRoot\Writing_System\Style_Guide\pacing_rules.md", "file"),
    @("$Src\Style\prose_style.md", "$RepoRoot\Writing_System\Style_Guide\prose_style.md", "file"),
    @("$Src\Style\the_70_30_rule.md", "$RepoRoot\Writing_System\Style_Guide\the_70_30_rule.md", "file"),
    @("$Src\Style\voice_examples.md", "$RepoRoot\Writing_System\Style_Guide\voice_examples.md", "file"),
    @("$Src\orchestrator\MASTER_ORCHESTRATOR_PROMPT.md", "$RepoRoot\Writing_System\Orchestrator\MASTER_ORCHESTRATOR_PROMPT.md", "file"),
    @("$Src\Bible\README.md", "$RepoRoot\Universe\README_legacy_bible_index.md", "file")
)

$moved = @()
foreach ($m in $moves) {
    $from, $to, $kind = $m
    if ($kind -eq "wholedir") {
        if (Test-Path $from) {
            Ensure-Dir (Split-Path $to -Parent)
            if (Test-Path $to) { Remove-Item $to -Recurse -Force -ErrorAction SilentlyContinue }
            Move-Item -Path $from -Destination $to -Force
            $moved += "DIR $from -> $to"
        }
    } elseif ($kind -eq "dir") {
        if (Test-Path $from) {
            Get-ChildItem $from -File | ForEach-Object {
                $dest = Join-Path $to $_.Name
                Ensure-Dir $to
                if (Move-ItemSafe $_.FullName $dest) { $moved += "$($_.FullName) -> $dest" }
            }
        }
    } elseif ($kind -eq "file-copy") {
        if (Test-Path $from) {
            Copy-Item $from $to -Force
            $moved += "COPY $from -> $to"
        }
    } else {
        if (Move-ItemSafe $from $to) { $moved += "$from -> $to" }
    }
}

# Remove empty legacy folders if possible
$legacyDirs = @(
    "$Src\chapters", "$Src\State", "$Src\Engine", "$Src\Style", "$Src\orchestrator",
    "$Src\Bible\book_structure", "$Src\Bible\characters", "$Src\Bible\world", "$Src\Bible\empires",
    "$Src\Bible\Ships\Classes", "$Src\Bible\Ships\Instances", "$Src\Bible\Ships", "$Src\Bible"
)
foreach ($d in $legacyDirs) {
    if ((Test-Path $d) -and -not (Get-ChildItem $d -Recurse -Force -ErrorAction SilentlyContinue)) {
        Remove-Item $d -Force -Recurse -ErrorAction SilentlyContinue
    }
}
if ((Test-Path $Src) -and -not (Get-ChildItem $Src -Recurse -Force -ErrorAction SilentlyContinue)) {
    Remove-Item $Src -Force -Recurse -ErrorAction SilentlyContinue
}

$moved | Set-Content (Join-Path $RepoRoot "restructure_moved_files.txt") -Encoding UTF8
Write-Host "Moved $($moved.Count) items"
