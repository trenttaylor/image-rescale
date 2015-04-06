LICENSE ===========================================================================

The MIT License (MIT)

Copyright (c) 2015 Trent Taylor

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


INSTRUCTIONS ======================================================================

1. Open Matlab
2. Navigate to folder contianing image_rescale_script.m
3. Run "image_rescale_scrpit.m"
4. Select the folder with images using the input prompt
5. Crop the first image using given crop window
6. Right click and select "crop" in the image window
7. Wait for processing to complete, "Finished!" will appear in the output window
8. Examine output files in the ./processed folder

Operation Notes:
1. If for some reason the script fails after the crop, then re-run the script
on the same folder. It will read the old crop data and run.

2. Area of interest must remain constant between all images. If the weld position
changes the crop will likely crop out the weld area. This was solved by deleting 
the first image on some of the tests. These had welds that were in a different
position than all of the remaining images.

