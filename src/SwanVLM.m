function [FiNest] = SwanVLM(dirName,Desired_SM)
%function SwanVLM
% -------------------------------------------------------------------------
% SwanVLM
% Version 5 (EXPORT)
% April 2009
% Copyright (C) 2008, 2009 Chris Walton (368404)

% SwanVLM.m: Central file from which all major functions are called.
% -------------------------------------------------------------------------

% Set input file path
InputRelPath = strcat(dirName,'/');

% Display splash-screen
Splash

% Ask user for input filename
[filename, FileExists, geo.UserFileName] = InputConfig(InputRelPath);
if FileExists ~= 1
    DisplayUserUpdate(6)
    return
else
    DisplayUserUpdate(1)
end

% Start runtime stopwatch
tic

% Read enviroment setup
[env, geo] = ConfigRead(filename, geo);
DisplayUserUpdate(2)

% Generate Mesh
[geo] = MeshGenerate3(filename, geo);
DisplayUserUpdate(3)

% Generate Inf. Coeff. Matrix
[gamma] = GenerateInfCoeff2(geo);

% Run solution for alpha's
[result, gamma] = solver(env, geo, gamma);
DisplayUserUpdate(4)

% Save result
SaveResults(filename, result,geo)
DisplayUserUpdate(7)

% Stop runtime stopwawtch
toc

% Inform user
DisplayUserUpdate(5, filename)

% Make nice pictures?
UserResponse = 'N';
if UserResponse == 'Y' || UserResponse == 'y'
    MakePictures(result,geo,env,gamma,InputRelPath)
end

% Return struct's to MATLAB workspace
 assignin('base','result',result);
 assignin('base','geo',geo);
 assignin('base','gamma',gamma);
 assignin('base','env',env);
 if abs(-Desired_SM+result.StaticMargin)<5
     FiNest=-max(result.LtD_ratio);
 else 
     FiNest=-max(result.LtD_ratio)+1000;
 end
end