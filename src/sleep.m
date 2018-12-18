function [Valid] = sleep(NoFiles, Valid)

% SHOULD BE INPUT?
wait = 30;
waitMax = 72*3600;

waitTime = 0;
jobcheck = 0;
NoCheck = 1;

while (jobcheck == 0)
    
    fprintf('Sleep');
    pause(wait)
    fprintf(['Wake up...Start Check .', num2str(NoCheck)]);
    NoCheck = NoCheck + 1;
    
    for i = 1:NoFiles
      
        if (Valid(i,1) == 1)
            dirName = strcat('nest',num2str(i));
            cd(dirName);
            system(['[ -e ', dirName, '.e* ] && echo 1 > check.txt || echo 0 > check.txt']);
            
            
            jobcheck = importdata('check.txt');
            
            
            waitTime = wait + waitTime;
 %           if (waitTime > waitMax)
 %               disp('Cluster Simulation Time exceeded maximum waiting Time');
 %               Valid(i,1) = 0;     
 %           end
                   
            
            cd('..');
            
            if (jobcheck == 0)
                break
            end

        end
    end
    
end
fprintf('Check successful...Solver done');

for i = 1:NoFiles
   
    if (Valid(i,1) == 1)
         dirName = strcat('nest',num2str(i));
        cd(dirName);
        system(['rm -f ', dirName, '.e*']);
        cd('..');
    end
end

end
