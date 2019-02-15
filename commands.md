## Pdf files etc
#### Compress pdf with colored images
`gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true \
-dColorImageResolution=500 -dNOPAUSE -dBATCH -sOutputFile=light-field-probes-final-compressed.pdf light-field-probes-final.pdf`

#### Join pdf files
`pdfunite in-file1.pdf in-file2.pdf output.pdf`

#### Split pdf files
`pdftk file.pdf burst`

##### With a different format sized file
`pdfjoin --paper a4paper --outfile output.pdf main.pdf resume.pdf screen2.png --no-tidy --rotateoversize false`

## Move, copy etc
#### Move several files
`mv -t destination file1 file2 file3`  
`mv *identifier* /destination/`  

## Loops, folder related statements
#### for loop and files
`for i in {1..6}; do cp lab"$i".pdf TNM079_lab"$i".pdf; done`

#### rename same file extensions with for loop
`for file in *.js; do mv "$file" "${file%.js}.ts"; done`

## I3 stuff
#### Find window class name for specifying open as floating window etc.
`xprop | grep -i 'class'`

## Clean root partition
`ncdu -x /`
`sudo pacman -Qdt`
`pacgraph -c`

## Git
#### Set windows line endings locally in a repo
`git config --local core.autocrlf true`

