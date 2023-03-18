$input_file=".\Reaper_Projects\CleanProjectInput\Test-Project-1\Test-Project-1.rpp"
Write-Host $input_file

#Get just the path where the project file is located
$input_file_path = Split-Path -Path $input_file

# Get just the base filename of that path.  i.e. "project.rpp" gets just "project"
$input_file_name = (Get-Item $input_file).Basename

# Build a new project file name with the directory and new project file name
$output_file_name = $input_file_name + "_render_stems" + ".rpp"

# Build a complete payj to the new file
$output_file_path = Join-Path -Path $input_file_path -ChildPath $output_file_name

Write-Host $output_file_path

# Copy the real project file to our new "_render_stems" project file
Copy-Item $input_file $output_file_path

#do replacements to override some render properties
(Get-Content $output_file_path).replace('RENDER_STEMS 0', 'RENDER_STEMS 1') | Set-Content $output_file_path

$Command = "C:\Program Files\REAPER (x64)\reaper.exe"
$nosplash =  '-nosplash'
$renderproject = '-renderproject'

& $Command $nosplash $renderproject $output_file_path