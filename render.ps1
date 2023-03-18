
#### Configure

$ReaperEXE = "C:\Program Files\REAPER (x64)\reaper.exe"
$OutputFolder = "c:\temp\reaper_project\output"

#### End Configure

$OutputFolderResolved = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputFolder)


function Update-InProjectFile {

    param (
        $ProjectFilePath,
        $SearchForPropertyName,
        $ReplaceWith
    )

    $line = Get-Content $ProjectFilePath | Select-String $SearchForPropertyName | Select-Object -ExpandProperty Line
    Write-Host "Found on line: " + $line
    $content = Get-Content $ProjectFilePath
    $content | ForEach-Object {$_ -replace $line, $ReplaceWith} | Set-Content $ProjectFilePath

}


$input_file=".\Reaper_Projects\CleanProjectInput\Test-Project-1\Test-Project-1.rpp"
Write-Host $input_file

#Get just the path where the project file is located
$input_file_path = Split-Path -Path $input_file

# Get just the base filename of that path.  i.e. "project.rpp" gets just "project"
$input_file_name = (Get-Item $input_file).Basename

# Build a new project file name with the directory and new project file name
$output_file_name = $input_file_name + "_render_stems" + ".rpp"

# Build a complete path to the new file
$output_file_path = Join-Path -Path $input_file_path -ChildPath $output_file_name

Write-Host $output_file_path

# Copy the real project file to our new "_render_stems" project file
Copy-Item $input_file $output_file_path


#do replacements to override some render properties
Update-InProjectFile $output_file_path 'RENDER_FILE' "  RENDER_FILE $OutputFolderResolved"
Update-InProjectFile $output_file_path 'RENDER_PATTERN' "  RENDER_PATTERN `"`$tracknumber-`$trackname`""
Update-InProjectFile $output_file_path 'RENDER_FMT' "  RENDER_FMT 0 2 44100"
Update-InProjectFile $output_file_path 'RENDER_RANGE' "  RENDER_RANGE 1 0 0 18 1000"
Update-InProjectFile $output_file_path 'RENDER_STEMS' "  RENDER_STEMS 1"

$nosplashFlag =  '-nosplash'
$renderprojectFlag = '-renderproject'

& $ReaperEXE $nosplashFlag $renderprojectFlag $output_file_path
