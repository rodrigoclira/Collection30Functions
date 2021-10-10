clear all
clc

% Global variables
global counter FunEvalGA bestGA bestGA1
global FunEvalPSO bestPSO bestPSO1
global historySQP

addpath('mainprog')
addpath('mainprog\functions') % Folder of the objective functions
rng default % For reproducibility of results

% Methods  | Num. of Dimensions
% 1. GA   | 1. D=5
% 2. PSO  | 2. D=10
% 3. SQP  | 3. D=34
%         | 4. D=50

% 30 problems in total
% 10 runs, to report the average results
% 2*4*30*10=2400 optimization runs for GA + PSO in total
% Plus 4*30=120 SQP runs. SQP is run once per problem as it is
% a deterministic method

NumRuns=1; % Each problem is run 10 times in the paper
% Here we set NumRuns=2 to obtain faster results
% If NumRuns=10, the results of the paper can be reproduced exactly

addpath('mainprog\functions') % Folder of the objective functions
currentFolder = pwd; % Current folder

% The default Renderer in MATLAB is 'opengl'
set(0, 'DefaultFigureRenderer', 'painters'); % 'painters' gives better emf results (when copied in MS Word)
% Remove the above line if it causes any problems, or use the following line instead
% set(0, 'DefaultFigureRenderer', 'opengl');

str = fileread('mainprog\functions.txt');   %read entire file into string
  parts = strtrim(regexp( str, '(\r|\n)+', 'split'));  %split by each line
  columns = strtrim( regexp(parts{1}, '\s+', 'split'));  %columns
  ncol = length(columns);  %number of columns
  parts(1)= [];  %remove column headers
  NumFunctions = length(parts);  %number of rows
  M = cell( NumFunctions, ncol);  %pre-allocate empty cell array for data
  %now loop through parts
  
  for k=1:NumFunctions;
    data = strtrim(regexp( parts{k}, '\s+', 'split'));   %split by spaces ='\s+'
    M(k,:) = data;
  end

% Preallocate Memory for Cell Arrays, for speed
FunctionNames=cell(NumFunctions,1); % String column
FunctionFiles=cell(NumFunctions,1); % String column
LBString=cell(NumFunctions,1); % Column vector
UBString=cell(NumFunctions,1); % Column vector

for k=1:NumFunctions
    FunctionNames{k}=M{k,1}; % Get Function names as strings
    FunctionFiles{k}=M{k,2}; % Get Function files as strings
    LBString{k}=M{k,3}; % Get Function Lower Bounds as strings
    UBString{k}=M{k,4}; % Get Function Upper Bounds as strings
end

LBArray=str2double(LBString);
UBArray=str2double(UBString);

for iDim=1:4;
    switch iDim % Number of variables (dimensions)
        case 1;
            D = 5;
        case 2;
            D = 10;
        case 3;
            D = 30;
        case 4;
            D = 50;
        otherwise        
            disp('No dimension information found')
            return
    end

    NP=min(10*D,50); % Population size for GA, PSO
        % GA MATLAB default: 50 when D <= 5, else 200
        % PSO MATLAB default: min(100,10*D)
    MaxIter=20*D-50; % Max. number of generations/iterations for GA, PSO
        % GA MATLAB default: 100*D
        % PSO MATLAB default: 200*D

    % Run all 30 optimization problems
    for FunctionCase=1:NumFunctions;
        historySQP.x = [];
        historySQP.fval = [];
        historySQP.objcount = [];

        fun = str2func(FunctionFiles{FunctionCase});
        funName=FunctionNames{FunctionCase};
        
        BoundsMin=LBArray(FunctionCase); % Lower bound
        BoundsMax=UBArray(FunctionCase); % Upper bound
        LB = BoundsMin*ones(1,D); % Lower bound as vector for all variables
        UB = BoundsMax*ones(1,D); % Upper bound as vector for all variables

        
        % **************** 1. SQP based on MATLAB Optimization
        tic
        x0 = (BoundsMax-BoundsMin).*rand(1,D) + BoundsMin;  % Starting guess at the solution
        options = optimoptions('fmincon','Display','iter','Algorithm','sqp','OutputFcn',@outfunSQP, ...
            'MaxFunctionEvaluations', NP*MaxIter,'StepTolerance',1e-30, ...
            'ConstraintTolerance',1e-30, 'OptimalityTolerance', 1e-30); % SQP Optimization options
        % The syntax of fmincon is: x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
        [xSQP,fvalSQP,exitflagSQP,outputSQP] = fmincon(fun,x0,[],[],[],[],LB,UB,[],options);
        TimeSQP = toc;
         outputSQP.funcCount;

         
        % **************** 2. GA based on MATLAB Optimization
        tic
        optionsGA = optimoptions('ga','OutPutFcn',@gaoutputfcn);
        optionsGA.MaxGenerations=MaxIter-1;
        optionsGA.PopulationSize=NP;
        optionsGA.MaxStallGenerations=MaxIter-1;
            
        clearvars xGA fvalGA exitflagGA outputGA convHistAllGA
        for iRun=1:NumRuns % Number of Runs, to take the average and plot the convergence history
            counter=0;
            [xGA(iRun,:),fvalGA(iRun,:),exitflagGA(iRun,:),outputGA{iRun}] = ga(fun,D,[],[],[],[],LB,UB,[],optionsGA);
            convHistAllGA(iRun,:)=bestGA; % NumRuns rows containing all results for all iterations and all Runs
        end
        
        xGA; %x vector of best solutions, NumRuns x D
        fvalGA; % the best values for each run, NumRuns x 1
        convHistPlotAvGA=mean(convHistAllGA,1); % Average value of the obj. fun. to plot later on
        TimeGA = toc;
        

        % **************** 3. PSO based on MATLAB Optimization
        tic;
        optionsPSO = optimoptions('particleswarm','OutputFcn',@pswplotranges);
        optionsPSO.MaxIterations=MaxIter-1;
        optionsPSO.SwarmSize=NP;
        optionsPSO.MaxStallIterations=MaxIter-1;
        
        clearvars xPSO fvalPSO exitflagPSO outputPSO convHistAllPSO
        for iRun=1:NumRuns; % Number of Runs, to take the average and plot the convergence history
            counter=0;
            [xPSO(iRun,:),fvalPSO(iRun,:),exitflagPSO(iRun,:),outputPSO{iRun}] = particleswarm(fun,D,LB,UB,optionsPSO);
            convHistAllPSO(iRun,:)=bestPSO;
        end
        
        xPSO; %x vector of best solutions, NumRuns x D
        fvalPSO; % the best values for each run, NumRuns x 1
        convHistPlotAvPSO=mean(convHistAllPSO,1); % Average value of the obj. fun. to plot later on
        TimePSO = toc;
        

        % Finished with all optimization cases
        % Collect all results for this FunctionCase

        Problems(FunctionCase).xGA=xGA;
        Problems(FunctionCase).fvalGA=fvalGA;
        Problems(FunctionCase).xPSO=xPSO;
        Problems(FunctionCase).fvalPSO=fvalPSO;
        Problems(FunctionCase).xSQP=xSQP;
        Problems(FunctionCase).fvalSQP=fvalSQP;

        Times(FunctionCase).GA=TimeGA;
        Times(FunctionCase).PSO=TimePSO;
        Times(FunctionCase).SQP=TimeSQP;
        
        % **************** Plot the convergence histories
        if FunctionCase<=15
            figure(2*iDim-1)
            subplot(5,3,FunctionCase);
            semilogy(FunEvalGA, convHistPlotAvGA, ... % GA
                FunEvalPSO, convHistPlotAvPSO, ... % PSO
                historySQP.objcount, historySQP.fval, ... % SQP
                'LineWidth',2);

            % Title of the subfigure
            if FunctionCase<=9;
                TitleString=['F0' num2str(FunctionCase) ' - ' funName];
            else
                TitleString=['F' num2str(FunctionCase) ' - ' funName];
            end

            title(TitleString, 'Interpreter', 'none') % Title of the subfigure

            % Axes titles, only for the bottom subfigures to save space
            if FunctionCase == 13 || FunctionCase == 14 || FunctionCase == 15;
                xlabel('Function evaluations')
            end
            if FunctionCase == 1 || FunctionCase == 4 || FunctionCase == 7 || FunctionCase == 10 || FunctionCase == 13;
                ylabel('Obj. fun.');
            end

            % Legend, only for one subfigure, the top right
            if FunctionCase == 3;
                legend('GA', 'PSO', 'SQP', 'Location', 'NorthEast');
            end

            FigName=strcat('Number of dimensions D=',num2str(D),', Functions F01-F15');
            sgtitle(FigName);

            
        else
            figure(2*iDim)
            subplot(5,3,FunctionCase-15);
            semilogy(FunEvalGA, convHistPlotAvGA, ... % GA
                FunEvalPSO, convHistPlotAvPSO, ... % PSO
                historySQP.objcount, historySQP.fval, ... % SQP
                'LineWidth',2);

        
            % Title of the subfigure
            if FunctionCase<=9;
                TitleString=['F0' num2str(FunctionCase) ' - ' funName];
            else
                TitleString=['F' num2str(FunctionCase) ' - ' funName];
            end

            title(TitleString, 'Interpreter', 'none') % Title of the subfigure

            % Axes titles, only for the bottom subfigures to save space
            if FunctionCase == 28 || FunctionCase == 29 || FunctionCase == 30;
                xlabel('Function evaluations')
            end
            if FunctionCase == 16 || FunctionCase == 19 || FunctionCase == 22 || FunctionCase == 25 || FunctionCase == 28;
                ylabel('Obj. fun.');
            end

            % Legend, only for one subfigure, the top right
            if FunctionCase == 18;
                legend('GA', 'PSO', 'SQP', 'Location', 'NorthEast');
            end

            FigName=strcat('Number of dimensions D=',num2str(D),', Functions F16-F30');
            sgtitle(FigName);
            
            
            
        end
        
        
        set(gcf, 'Position',  [200, 100, 800, 1200]); % Position the figures on the screen
        f = gcf;

        saveas(gcf,append(currentFolder,'\Figures\OptiResults\',FigName, '.fig'))
        exportgraphics(f,append(currentFolder,'\Figures\OptiResults\',FigName, '.emf'))
        exportgraphics(f,append(currentFolder,'\Figures\OptiResults\',FigName, '.png'),'Resolution',300)
        
    end

    % Now store all the information and proceed to next number of Dimensions
    
    AllProblems{iDim}=Problems;
    AllTimes{iDim}=Times;

end

save('AllProblems.mat','AllProblems') %Save the variable with the results for all problems
save('AllTimes.mat','AllTimes') %Save the variable with the results for all problems















