function [ mesh ] = read_mesh( filename )
%READ_MESH Summary of this function goes here
%   Detailed explanation goes here

%copy the mesh file to a .txt extension so that MATLAB doesn't cock your life up trying to read
newfilename = 'readmesh.txt';
copyfile(filename,newfilename)
filename = newfilename;

DELIMITER = ' ';
HEADERLINES = 5;

newData1 = importdata(filename, DELIMITER, HEADERLINES);
NoElem = newData1.data(1);
NoPoints = newData1.data(2);

HEADERLINES = 7;

newData1 = importdata(filename, DELIMITER, HEADERLINES);

mesh.connec = newData1.data(:,2:4);

HEADERLINES = 8 + NoElem;

newData1 = importdata(filename, DELIMITER, HEADERLINES);

mesh.xy = newData1.data(:,2:3);

delete(filename)

end

