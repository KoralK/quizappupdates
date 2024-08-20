# Define the list of PNG files to keep
$filesToKeep = @(
    "phone_accessibility_large_font.png",
    "phone_correct_answers_screen.png",
    "phone_initial_screen.png",
    "phone_question_screen_long.png",
    "phone_question_screen_short.png",
    "phone_results_screen_high_score.png",
    "phone_results_screen_low_score.png"
)

# Get all PNG files in the current directory
$allPngFiles = Get-ChildItem -Path . -Filter *.png

# Loop through all PNG files
foreach ($file in $allPngFiles) {
    # If the file is not in the list to keep, delete it
    if ($filesToKeep -notcontains $file.Name) {
        Remove-Item $file.FullName -Force
        Write-Host "Deleted: $($file.Name)"
    }
    else {
        Write-Host "Kept: $($file.Name)"
    }
}

Write-Host "Cleanup complete."