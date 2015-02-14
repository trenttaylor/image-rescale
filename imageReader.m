function img = imageReader()

%% get filename and open file
[filename,pathname,~] = uigetfile('*.*');

img = imread([pathname,filename]);

end