

function Get-RenderStemsProjectFilePath {

    param (
        $input_file
    )

    #Get just the path where the project file is located
    $input_file_path = Split-Path -Path $input_file

    # Get just the base filename of that path.  i.e. "project.rpp" gets just "project"
    $input_file_name = (Get-Item $input_file).Basename

    # Build a new project file name with the directory and new project file name
    $output_file_name = $input_file_name + "_render_stems" + ".rpp"

    # Build a complete path to the new file
    # This will be sent into reaper.exe as the project to render
    $output_file_path = Join-Path -Path $input_file_path -ChildPath $output_file_name

    return $output_file_path
}

# Updates the given Reaper project's file's property with the given one.
function Update-InProjectFile {

    param (
        $ProjectFilePath,
        $SearchForPropertyName,
        $ReplaceWith
    )

    $line = Get-Content $ProjectFilePath | Select-String $SearchForPropertyName | Select-Object -ExpandProperty Line
    Write-Host "Found on line: " + $line
    $content = Get-Content $ProjectFilePath
    $content | ForEach-Object {$_ -replace $line, "$SearchForPropertyName $ReplaceWith"} | Set-Content $ProjectFilePath

}