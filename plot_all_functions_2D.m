clear
clc

addpath('mainprog\functions') % Folder of the objective functions
currentFolder = pwd; % Current folder

% The default Renderer in MATLAB is 'opengl'
set(0, 'DefaultFigureRenderer', 'painters'); % 'painters' gives better emf results in MS Word
% Remove the above line if it causes any problems, or use the following
% line instead
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

% Plot all the functions for the D=2 case

plotIntervals=50; %Intervals for each direction x, y
zoomFactor=10; %Zoom factor for plotting the zoomed function
%OptiLocation=[0 0] % The location of the optimum is at zero in all functions considered

Z=zeros(plotIntervals+1,plotIntervals+1); %Initialize Z matrix

for k=1:NumFunctions % For all functions
    fun = FunctionFiles{k}; % function name
    LB=LBArray(k); % Lower Bound of function
    UB=UBArray(k); % Upper Bound of function
    
    if k<=9;
        Title1=['F0' num2str(k) ' - '];
    else
         Title1=['F' num2str(k) ' - '];
	end
    
    figure(k)
    figureTitle=append(Title1,FunctionNames{k}, ' Function');
    sgtitle(figureTitle);
    
    %Plot zoomed function first (on the left)
    stepx=(UB/zoomFactor-LB/zoomFactor)/plotIntervals;
    stepy=stepx;

    x=LB/zoomFactor:stepx:UB/zoomFactor;
    y=LB/zoomFactor:stepy:UB/zoomFactor;

    [X,Y]=meshgrid(x,y);

    for ix=1:size(X,1);
        for iy=1:size(X,2);
            Z(ix,iy)=feval(fun, [X(ix,iy) Y(ix,iy)]);
        end
    end
    
    % Draw surface plot for zoomed function
    subplot(1,2,1);
    surfc(X,Y,Z, 'FaceColor','interp', 'edgecolor',[0.2 0.2 0.2]);
    xlabel('x1')
    ylabel('x2')
    zlabel('f','Rotation',0)
    grid on
    %colorbar('AxisLocation','out')
    
    %Plot normal function second (on the right)
    stepx=(UB-LB)/plotIntervals;
    stepy=stepx;

    x=LB:stepx:UB;
    y=LB:stepy:UB;
    [X,Y]=meshgrid(x,y);

    for ix=1:size(X,1);
        for iy=1:size(X,2);
            Z(ix,iy)=feval(fun, [X(ix,iy) Y(ix,iy)]);
        end
    end

    % Draw surface plot
    subplot(1,2,2);
    surfc(X,Y,Z, 'FaceColor','interp', 'edgecolor',[0.2 0.2 0.2]);
    xlabel('x1')
    ylabel('x2')
    zlabel('f','Rotation',0)
    grid on
    %colorbar('AxisLocation','out')
    
    
    set(gcf, 'Position',  [200+15*k, 200+10*k, 1300, 450]); % Position the figures on the screen
    f = gcf;
    
    saveas(gcf,append(currentFolder,'\Figures\FunctionsIn2D\',figureTitle, '.fig'))
    exportgraphics(f,append(currentFolder,'\Figures\FunctionsIn2D\',figureTitle, '.emf'))
    exportgraphics(f,append(currentFolder,'\Figures\FunctionsIn2D\',figureTitle, '.png'),'Resolution',300)

end
