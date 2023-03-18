

# Where is your reaper.exe?
$ReaperEXE = "C:\Program Files\REAPER (x64)\reaper.exe"

#  The folder to search recursively for Reaper Project files
#$SearchFolder = ""

# Render pattern for the files.  You can use Reaper wildcards here:
$RenderPattern = "`"`$tracknumber-`$trackname`""

# This is where your rendered files will appear.  
# It is what goes into the File > Render > Output > Directory textbox in Reaper's Render dialog
# If the path does not exist it will be created.
# You can also use relative paths like:
#
#   $OutputFolder = ".\directory\under\this\script"
#
$OutputFolder = "c:\temp\reaper_project\output"


# The suffix to attach to the end of the project file copy that 
# this script makes.  E.g.:
#
#  $RenderStemsProjectFileSuffix = "_render_stems_file"
#  
#  Your project file: my_project.rpp
#
#  Becomes: my_project_render_stems_file.rpp
$RenderStemsProjectFileSuffix = "_render_stems_file"
