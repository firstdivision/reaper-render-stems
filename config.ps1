

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
