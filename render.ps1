# Import some helpers
. .\helper-functions.ps1
. .\config.ps1


# Get the full path to the output folder, even if it does not exist.
$OUTPUT_FOLDERResolved = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OUTPUT_FOLDER)


# Loop and search an input folder for all Reaper project files
$input_files = Find-ReaperProjectFiles $SEARCH_FOLDER
foreach ($input_file in $input_files)
{
    Write-Output "Processing file: $input_file."
    # Get the render_stems_project_file_path which is what Reaper will untlimately render
    #  (after we force some render settings)
    $render_stems_project_file_path = Get-RenderStemsProjectFilePath $input_file

    # Copy the real project file to our new "render_stems" project file
    Copy-Item $input_file $render_stems_project_file_path

    #do replacements to override some render properties
    Update-InProjectFile $render_stems_project_file_path 'RENDER_FILE' $OUTPUT_FOLDERResolved
    Update-InProjectFile $render_stems_project_file_path 'RENDER_PATTERN' $RENDER_PATTERN
    Update-InProjectFile $render_stems_project_file_path 'RENDER_FMT' "0 2 44100"
    Update-InProjectFile $render_stems_project_file_path 'RENDER_RANGE' "1 0 0 18 1000"
    Update-InProjectFile $render_stems_project_file_path 'RENDER_STEMS' "1"

    $nosplashFlag =  '-nosplash'
    $renderprojectFlag = '-renderproject'

    & $REAPER_EXE_PATH $nosplashFlag $renderprojectFlag $render_stems_project_file_path
    
    Write-Output "Finished processing file: $input_file."
}



