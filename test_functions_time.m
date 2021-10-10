clear
clc

addpath('mainprog\functions') % Folder of the objective functions
currentFolder = pwd; % Current folder

str = fileread('mainprog\functions.txt');   % Read entire file into string
  parts = strtrim(regexp( str, '(\r|\n)+', 'split'));  % Split by each line
  columns = strtrim( regexp(parts{1}, '\s+', 'split'));  % Columns
  ncol = length(columns);  % Number of columns
  parts(1)= [];  % Remove column headers
  NumFunctions = length(parts);  % Number of rows
  M = cell( NumFunctions, ncol);  % Pre-allocate empty cell array for data
  % Now loop through parts
  for k=1:NumFunctions;
    data = strtrim(regexp( parts{k}, '\s+', 'split')); % Split by spaces
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

NumRuns=1e3; % 100,000 times in the paper, 1000 times here

X = categorical({'F01','F02','F03','F04','F05','F06','F07','F08','F09','F10', ...
                 'F11','F12','F13','F14','F15','F16','F17','F18','F19','F20', ...
                 'F21','F22','F23','F24','F25','F26','F27','F28','F29','F30'});
X = reordercats(X,{'F01','F02','F03','F04','F05','F06','F07','F08','F09','F10', ...
                   'F11','F12','F13','F14','F15','F16','F17','F18','F19','F20', ...
                   'F21','F22','F23','F24','F25','F26','F27','F28','F29','F30'});

elapsedTime=zeros(4,NumFunctions); % Time for each function and each D

figure(1)
for iDim=1:4 % For the 4 dimensions (5, 10, 30, 50)
    switch iDim 
        case 1;
            D = 5; % 5 variables (dimensions)
            mytitle='D=5';
        case 2;
            D = 10; % 10 variables (dimensions)
            mytitle='D=10';
        case 3;
            D = 30; % 30 variables (dimensions)
            mytitle='D=30';
        case 4;
            D = 50; % 50 variables (dimensions)
            mytitle='D=50';
        otherwise        
            disp('No dimension information found')
        return
    end
    
    for FunctionCase=1:NumFunctions % Run all functions
        fun = str2func(FunctionFiles{FunctionCase}); % Function file name               
        tic % Start timer
        for ii=1:NumRuns
            RanVec=rand(1,D); % A random vector of dimension D
            TempVal=fun(RanVec); % Value of the objective function
        end
        elapsedTime(iDim,FunctionCase) = toc; % Stop timer and record time
    end 
    
    subplot(4,1,iDim)
    
    b=bar(X,elapsedTime(iDim,:)');
    ylabel('Time (sec)');
    if iDim==4; xlabel('Objective function'); end
    text([1:length(elapsedTime(iDim,:))], elapsedTime(iDim,:)', ...
        num2str(elapsedTime(iDim,:)','%0.2f'),'HorizontalAlignment','center','VerticalAlignment','bottom')
    set(gca,'YScale','log')
    title(mytitle, 'Interpreter', 'none') % Title of the subfigure
end


FileName='AllTimes';
set(gcf, 'Position',  [0, 0, 900, 1200]); % Position the figures on the screen
f = gcf;
saveas(f,append(currentFolder,'\Figures\FunctionsTime\',FileName, '.fig'))
exportgraphics(f,append(currentFolder,'\Figures\FunctionsTime\',FileName, '.emf'))
exportgraphics(f,append(currentFolder,'\Figures\FunctionsTime\',FileName, '.png'),'Resolution',300)

save('elapsedTime.mat','elapsedTime') %Save the variable with the times




