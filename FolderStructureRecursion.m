function [ files ] = FolderStructureRecursion( path, subDirectories )
%FOLDERSTRUCTURERECURSION Enumerates all the file in current directory and
%subdirectories.

%{
INPUTS:
    path (string): string containing path to root directory
OUTPUTS:
    files (cell): cell array contating all of the files located by the
    function
%}

%% initialization
folders = {};
files = {};

%% read directory
dir_results = dir(path);

%% read subdirectories and loop through each directory
for i = 3:size(dir_results,1)
    
    % sort folders
    if dir_results(i,1).isdir == 1
        folders{size(folders,1)+1,1} = [path, '\', dir_results(i,1).name];
        
    % sort files
    elseif dir_results(i,1).isdir == 0
        files{size(files,1)+1,1} = [path, '\',dir_results(i,1).name];
    else
        error('Not a vaild folder or file');
    end
        
end

%% cycle through folders
if subDirectories

    for d = 1:size(folders,1)

        [files2] = FolderStructureRecursion(folders{d,1});

        files = [files;files2];
    end
end
end