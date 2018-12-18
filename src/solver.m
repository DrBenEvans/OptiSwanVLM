function [result, gamma] = solver(env, geo, gamma)

% -------------------------------------------------------------------------
% SwanVLM
% Version 5 (EXPORT)
% April 2009
% Copyright (C) 2008, 2009 Chris Walton (368404)

% solver.m: Draws together the processor and post-processor to solve gamma
% for each specified angle of attack.
% -------------------------------------------------------------------------


% Initialise the result struct variables
result.CLift = [];
result.CDrag = [];
result.CDrag_total = [];
result.LtD_ratio = [];
result.AlphaGeo = [];
result.w_ind = [];
result.gamma = [];

% Generate a row matrix of alpha's to solve for
gamma.AlphaRange = env.AlphaMin:env.AlphaStep:env.AlphaMax;

% Call Processor and Post-Processor for each alpha
for i = 1:length(gamma.AlphaRange)
    % Convert alpha to rad's and set
    env.alpha = (pi/180)*(gamma.AlphaRange(i));

    % Call the Processor
    [gamma] = Processor(env, geo, gamma);

    % Call the Post-Processor
    [result] = PostProcess3(env, geo, gamma, result, 'InAlphaLoop');
    
    % Store each set of result for gamma (vortex strength)
    result.gamma(:,i) = gamma.total(:,1);
end


% Call final post-processing routines
[result] = PostProcess3(env, geo, gamma, result, 'PostAlphaLoop');
[result] = PostProcess3(env, geo, gamma, result, 'FinalProcessing');

end