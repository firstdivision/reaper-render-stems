# Search for Reaper projects and Render them as new projects with only stems


# Requirements
- Windows
- Reaper installed


# Notes:

## Reaper Command Line


## Links:
- https://github.com/ReaTeam/Doc/blob/master/REAPER-CLI.md
- https://www.reddit.com/r/Reaper/comments/mbf3n3/script_to_batchrender_every_project_in_a_folder/
    - https://github.com/rcraggs/reaper-auto-render/blob/main/auto-render.sh
- https://forum.cockos.com/showthread.php?t=207635

## Plan:
* Scan a folder for Reaper projects
* For each found project:
   * Render the project as: 
      * Stems+Master Track
      * Into a new parent destination folder
      * Include a .RPP file with it

Essentially it would duplicate the directory tree of projects and folders, but with only a bunch of Reaper projects and their rendered WAV stems.  

The reason is to have a sort of "backup" of all projects that are not dependent on any effects or anything.  So in 10 years, I can probably at least still open the project and get most of the song back, even if I originally used some sort of weird midi instrument -- I'll have this project backup with the rendered WAV version available.

For someone like me who has all their projects for every person they've ever worked with in a single folder, this could be something I'd run periodically into a "reaper\_projects\_stem\_backups" folder (ideally only re-rendering projects with a different modified date).

I think I see how to do most of it from your script which would be something like:

* Make a copy of the .rpp file called something like my\_project\_stems\_renderer.rpp
* Force/replace \`RENDER\_STEMS\` to 1.
* Force/replace \`RENDER\_FILE\` to <new output folder>.
* Force/replace \`RENDER\_PATTERN\` to something like \`$project-$track\` because why not try to name things cleanly as part of this process

## Project File Replacements:

```
  RENDER_FILE C:\Users\Andrew\Downloads\ReaperRenders
  RENDER_PATTERN $tracknumber-$trackname
  RENDER_FMT 0 2 44100
  
  RENDER_RANGE 1 0 0 18 1000
  
  RENDER_STEMS 1
  
  <RENDER_CFG
    ZXZhdxgIAQ==
  >
  ```

