
% Creates input parameter structure array needed to run TreeQSM function

clear inputs

%% QSM reconstruction parameters
% THE FIVE INPUT PARAMETERS TO BE OPTIMIZED.
% These CAN BE VARIED AND SHOULD BE OPTIMIZED 
% (they can have multiple values given as vectors, e.g. [0.01 0.02]).
% Patch size of the first uniform-size cover:
%inputs.PatchDiam1 = [0.08 0.12];        % orginal
%inputs.PatchDiam1 = [0.08];              % test   
%inputs.PatchDiam1 = [0.1];                 % Pasi
%inputs.PatchDiam1 = [0.1 0.12];             % alex
%inputs.PatchDiam1 = [0.02 .03];             % M
%inputs.PatchDiam1 = [0.045 .08];
%inputs.PatchDiam1 = [0.060 .08]; % Red woods
inputs.PatchDiam1 = [0.090 .11];


% Minimum patch size of the cover sets in the second cover:
%inputs.PatchDiam2Min = [0.02 0.03];         % orginal
%inputs.PatchDiam2Min = [0.02];              % test
%inputs.PatchDiam2Min = [0.03];                % Pasi
%inputs.PatchDiam2Min = [0.03 0.04];            % alex
%inputs.PatchDiam2Min = [0.003 .012];     % M
%inputs.PatchDiam2Min =  [0.0030 .0060 .0090 .012];
%inputs.PatchDiam2Min =  [0.0080 .0130 .0180 .023];
inputs.PatchDiam2Min =  [0.0110 0.0160 0.0210 0.026];

% Maximum cover set size in the stem's base in the second cover:
%inputs.PatchDiam2Max = [0.07 0.1];         % orginal
%inputs.PatchDiam2Max = [0.07];              % test
%inputs.PatchDiam2Max = [0.06];               % Pasi
%inputs.PatchDiam2Max = [0.06 0.09];            % alex
%inputs.PatchDiam2Max = [0.0150 .025];            % M
%inputs.PatchDiam2Max = [0.0150 .020 .025];
%inputs.PatchDiam2Max = [0.010 .0150 .02];
inputs.PatchDiam2Max = [0.013 .0180 .05];


% ADDITIONAL PATCH GENERATION PARAMETERS.
% The following parameters CAN BE VARIED BUT CAN BE USUALLY KEPT AS SHOWN 
% (i.e. little bigger than PatchDiam parameters).
% Ball radius in the first uniform-size cover generation:

%inputs.BallRad1 = inputs.PatchDiam1+0.015;          % orginal
%inputs.BallRad1 = 0.12;                               % Pasi
%inputs.BallRad1 = inputs.PatchDiam1+0.007;          % M
%inputs.BallRad1 = inputs.PatchDiam1+0.02; 
inputs.BallRad1 = inputs.PatchDiam1+0.04;

% Maximum ball radius in the second cover generation:
%inputs.BallRad2 = inputs.PatchDiam2Max+0.01;          % orginal
%inputs.BallRad2 = 0.075;                                 % Pasi
%inputs.BallRad2 = inputs.PatchDiam2Max+0.003;          % M
%inputs.BallRad2 = inputs.PatchDiam2Max+0.01;
inputs.BallRad2 = inputs.PatchDiam2Max+0.02;


% The following parameters CAN BE USUALLY KEPT FIXED as shown.
% Minimum number of points in BallRad1-balls, generally good value is 3:
inputs.nmin1 = 3; 
% Minimum number of points in BallRad2-balls, generally good value is 1:
inputs.nmin2 = 1; 
% Does the point cloud contain points only from the tree (if 1, then yes):
inputs.OnlyTree = 1; 
% Produce a triangulation of the stem's bottom part up to the first main
% branch (if 1, then yes):
inputs.Tria = 0; % don't generate the triangle thing  
% Compute the point-model distances (if 1, then yes):
inputs.Dist = 1; 

% RADIUS CORRECTION OPTIONS FOR MODIFYING TOO LARGE AND TOO SMALL CYLINDERS.
% These parameters CAN BE USUALLY KEPT FIXED as shown.
% Traditional TreeQSM choices:
% Minimum cylinder radius, used particularly in the taper corrections:
inputs.MinCylRad = 0.0025; 
% Radius correction based on radius of the parent. If 1, radii in a branch 
% are always smaller than the radius of the parent in the parent branch:
inputs.ParentCor = 1; 
% Taper correction of radii inside branches. If 1, use partially linear 
% (stem) and parabola (branches) taper corrections:
inputs.TaperCor = 1; 

% Growth volume correction approach introduced by Jan Hackenberg, 
% allometry: GrowthVol = a*Radius^b+c
inputs.GrowthVolCor = 0; % If 1, use growth volume (GV) correction 
% fac-parameter of the GV-approach, defines upper and lower bound. When 
% using GV-approach, consider setting TaperCorr = 0, ParentCorr = 0, 
% MinCylinderRadius = 0.
inputs.GrowthVolFac = 2.5; 

%% Other inputs
% These parameters don't affect the QSM-reconstruction but define what is
% saved, plotted, and displayed and how the models are named/indexed
% Name string for saving output files and naming models:
inputs.name = 'tree'; 
% Tree index. If modelling multiple trees, then they can be indexed uniquely:
inputs.tree = 1;
% Model index, can separate models if multiple models with the same inputs:
inputs.model = 1; 
% Save the output struct QSM as a matlab-file into \result folder. 
% If name = 'pine', tree = 2, model = 5, the name of the saved file is 
% 'QSM_pine_t2_m5.mat':
inputs.savemat = 1; 
% Save the models in .txt-files (check "save_model_text.m"):
inputs.savetxt = 0; 
% What are plotted during reconstruction process: 
% 2 = plots the QSM, the segmentated point cloud and distributions, 
% 1 = plots the QSM and the segmentated point cloud
% 0 = plots nothing
inputs.plot = 2; 
% What are displayed during the reconstruction: 2 = display all; 
% 1 = display name, parameters and distances; 0 = display only the name:
inputs.disp = 2; 