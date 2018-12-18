function [  ] = prepareDir( NoNests )
%PREPAREDIR This function prepares all the directories for the solver

for i = 1:NoNests
   
    dirName = strcat('nest',num2str(i));
    mkdir(dirName) % create the directory for each nest
    copyfile('example.xls',dirName);

end
