#### Compress pdf with colored images
`gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true \
-dColorImageResolution=500 -dNOPAUSE -dBATCH -sOutputFile=light-field-probes-final-compressed.pdf light-field-probes-final.pdf`

#### Move several files
`mv -t destination file1 file2 file3`  
`mv *identifier* /destination/`  

#### for loop and files
`for i in {1..6}; do cp lab"$i".pdf TNM079_lab"$i".pdf; done`
