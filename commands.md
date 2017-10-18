#### Compress pdf with colored images
`gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true \
-dColorImageResolution=500 -dNOPAUSE -dBATCH -sOutputFile=light-field-probes-final-compressed.pdf light-field-probes-final.pdf`

#### Move several files
`mv -t destination file1 file2 file3`  
`mv *identifier* /destination/`  
