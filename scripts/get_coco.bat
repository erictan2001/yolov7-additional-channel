@echo off

set d="%cd%/" &:: unzip directory
set url="https://github.com/ultralytics/yolov5/releases/download/v1.0/"
set f="coco2017labels-segments.zip" &:: or 'coco2017labels.zip', 68 MB
echo Downloading %url%%f%  ...
START /B /WAIT curl.exe -L %url%%f% -o %f% &:: unzip -q %f% -d %d% & rm %f% &:: download, unzip, remove in background
START /B /WAIT powershell -command "Expand-Archive -Force '%d%%f%' '%d%'" & rm %f%

:: Download/unzip images
set d="%cd%\coco\images" &:: unzip directory
set url="http://images.cocodataset.org/zips/"
set f1="train2017.zip" &:: 19G, 118k images
set f2="val2017.zip"   &:: 1G, 5k images
set f3="test2017.zip"  &:: 7G, 41k images (optional)
for %%A in (%f1% %f2% %f3%) do (
  echo Downloading %url%%f% ...
  START /B /WAIT curl.exe -L %url%%f% -o %f% &:: unzip -q %f% -d %d% & rm %f% &:: download, unzip, remove in background
  powershell -command "Expand-Archive -Force '%d%my_zip_file.zip' '%d%'" & rm %f%
)
wait # finish background tasks