

# Where is your reaper.exe?
Set-Variable -Name REAPER_EXE_PATH -Value "C:\Program Files\REAPER (x64)\reaper.exe" -Option Constant, AllScope -Force

#  The folder to search recursively for Reaper Project files
#  Where to search in for reaper files.  Can be relative like `.\` or a fully-qualified path
# like `c:\projects\reaper\my-songs
Set-Variable -Name SEARCH_FOLDER -Value ".\" -Option Constant, AllScope -Force

# Render pattern for the files.  You can use Reaper wildcards here:
Set-Variable -Name RENDER_PATTERN -Value "`"`$tracknumber-`$trackname`"" -Option Constant, AllScope -Force

# This is where your rendered files will appear.  
# It is what goes into the File > Render > Output > Directory textbox in Reaper's Render dialog
# If the path does not exist it will be created.
# You can also use relative paths like:
#
#   $OUTPUT_FOLDER = ".\directory\under\this\script"
#
Set-Variable -Name OUTPUT_FOLDER -Value "c:\temp\reaper_project\output" -Option Constant, AllScope -Force


# The suffix to attach to the end of the project file copy that 
# this script makes.  E.g.:
#
#  $RENDER_STEMS_PROJECT_FILE_SUFFIX = "_render_stems_file"
#  
#  Your project file: my_project.rpp
#
#  Becomes: my_project_render_stems_file.rpp
Set-Variable -Name RENDER_STEMS_PROJECT_FILE_SUFFIX -Value "_render_stems_file" -Option Constant, AllScope -Force
