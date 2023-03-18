# Import some helpers
. .\helper-functions.ps1
. .\config.ps1


# Get the full path to the output folder, even if it does not exist.
$OutputFolderResolved = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFolder)


# TODO: Loop and search an input folder for all Reaper project files
$input_file=".\Reaper_Projects\CleanProjectInput\Test-Project-1\Test-Project-1.rpp"

# Get the render_stems_project_file_path which is what Reaper will untlimately render
#  (after we force some render settings)
$render_stems_project_file_path = Get-RenderStemsProjectFilePath $input_file

# Copy the real project file to our new "render_stems" project file
Copy-Item $input_file $render_stems_project_file_path

#do replacements to override some render properties
Update-InProjectFile $render_stems_project_file_path 'RENDER_FILE' $OutputFolderResolved
Update-InProjectFile $render_stems_project_file_path 'RENDER_PATTERN' $RenderPattern
Update-InProjectFile $render_stems_project_file_path 'RENDER_FMT' "0 2 44100"
Update-InProjectFile $render_stems_project_file_path 'RENDER_RANGE' "1 0 0 18 1000"
Update-InProjectFile $render_stems_project_file_path 'RENDER_STEMS' "1"

$nosplashFlag =  '-nosplash'
$renderprojectFlag = '-renderproject'

& $ReaperEXE $nosplashFlag $renderprojectFlag $render_stems_project_file_path
