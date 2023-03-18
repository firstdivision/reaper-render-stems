$input_file="./Reaper_Projects/CleanProjectInput/Test-Project-1/Test-Project-1.rpp"
Write-Host $input_file

# Get content of project file
#$content = Get-Content -Path $input_file

#do replacements to override some render properties
(Get-Content $input_file).replace('RENDER_STEMS 0', 'RENDER_STEMS 1') | Set-Content $input_file

$Command = "C:\Program Files\REAPER (x64)\reaper.exe"
$nosplash =  '-nosplash'
$renderproject = '-renderproject'

& $Command $nosplash $renderproject $input_file