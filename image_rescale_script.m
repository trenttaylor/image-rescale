clear;
close all;
clc;

%% inputs
maskSize = 3; %should be odd





%%
disp('IMAGE PROCESSOR');
disp('Select Folder:');
folder = uigetdir();
files = FolderStructureRecursion(folder, false);
disp(['Found ',size(files,1), ' files.']);

if ~exist([folder,'\processed\'],'dir')
    mkdir([folder,'\processed\']);
end

%% for each image process it
for f = 1:size(files,1)

    %% Open Image
    [path,name,ext] = fileparts(files{f});
    if (~(strcmp(ext,'.jpg') || strcmp(ext,'.png')))
        continue;
    end
    disp(['Processing ', name,ext,'...']);
    image = imread(files{f});

    %% crop image
    %image = imcrop(image);
    if exist([folder,'\cropdata.mat'],'file')
        load([folder,'\cropdata.mat']);
        image = image(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3),:);
        original = image;
    else
        fig1 = figure;
        [~,rect] = imcrop(image);
        image = image(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3),:);
        original = image;
        close(fig1);
        rect = round(rect);
        save([folder,'\cropdata.mat'],'rect');
    end

    %% Resample Pixels
    % upsample and resample to double data type
    image = im2double(image);
    image = rgb2gray(image);
    image = impyramid(image,'expand');

    %% process image
    image = medfilt2(image,[maskSize maskSize]);
    image = histeq(image);

    %% Output Image

    finalImg(:,:,:,f) = ind2rgb(gray2ind(image,255),jet(255));

    %% Display Image
    %imshow(finalImg);
    imwrite(image(:,:,:),[folder,'\processed\Gray_',name,'.jpg'],'jpg');
    imwrite(finalImg(:,:,:,f),[folder,'\processed\RGB_',name,'.jpg'],'jpg');
    imwrite(original(:,:,:),[folder,'\processed\Original_',name,'.jpg'],'jpg');
end
%% display results
implay(finalImg,2);
set(findall(0,'tag','spcui_scope_framework'),'position',[150 10 300 960]);
disp('FINISHED!');

%%
%{
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
%}