function [ FiNest ] = solveAll( piNest,NoNests,Desired_SM )
%SOLVEALL This function runs the solver in each nest's own directory
FiValid = ones(NoNests,1);

%Loop round each dir, make input files and solve

for i = 1:NoNests
    dirName = strcat('nest',num2str(i));
    cd(dirName); % set current directory
    xlswrite('example.xls', piNest(i,1), 'Geometry','G5') %write foreplane root chord
    xlswrite('example.xls', piNest(i,2), 'Geometry','I5') %write foreplane tip chord
    xlswrite('example.xls', piNest(i,3), 'Geometry','J5') %write span 
    xlswrite('example.xls', piNest(i,4), 'Geometry','C5') %write canard position 
    xlswrite('example.xls', piNest(i,5), 'Geometry','I4') %write wing tip chord 
    
    cd('..');
    [FiNest_i]=SwanVLM(dirName,Desired_SM);
    FiNest(i,1) = FiNest_i;
        
end
