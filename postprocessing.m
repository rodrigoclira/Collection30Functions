clear
clc

currentFolder = pwd % Current folder

load('AllProblems.mat')
load('AllTimes.mat')

NumProblems= size(AllProblems{1}(:),1) %30 problems
NumRuns=size(AllProblems{1}(1).fvalGA,1) %10 runs in the paper
% 1 run here for faster results

for i=1:NumProblems; %DIM 5 results
    GA5fval(i)=mean(AllProblems{1}(i).fvalGA,1);
    PSO5fval(i)=mean(AllProblems{1}(i).fvalPSO,1);
    SQP5fval(i)=AllProblems{1}(i).fvalSQP,1;
end

for i=1:NumProblems; %DIM 10 results
    GA10fval(i)=mean(AllProblems{2}(i).fvalGA,1);
    PSO10fval(i)=mean(AllProblems{2}(i).fvalPSO,1);
    SQP10fval(i)=AllProblems{2}(i).fvalSQP,1;
end

% Results for the D=5, D=10 cases
DIM5_10Results=[GA5fval;PSO5fval;SQP5fval;GA10fval;PSO10fval;SQP10fval]'


for i=1:NumProblems; %DIM 30 results
    GA30fval(i)=mean(AllProblems{3}(i).fvalGA,1);
    PSO30fval(i)=mean(AllProblems{3}(i).fvalPSO,1);
    SQP30fval(i)=AllProblems{3}(i).fvalSQP,1;
end

for i=1:NumProblems; %DIM 50 results
    GA50fval(i)=mean(AllProblems{4}(i).fvalGA,1);
    PSO50fval(i)=mean(AllProblems{4}(i).fvalPSO,1);
    SQP50fval(i)=AllProblems{4}(i).fvalSQP,1;
end

% Results for the D=30, D=50 cases
DIM30_50Results=[GA30fval;PSO30fval;SQP30fval;GA50fval;PSO50fval;SQP50fval]'


%first 15 problems, then the other 15 problems
for i=1:15;
    fD5a(1,i)=mean(AllProblems{1}(i).fvalGA,1);
    fD5a(2,i)=mean(AllProblems{1}(i).fvalPSO,1);
    fD5a(3,i)=AllProblems{1}(i).fvalSQP;
    
    fD5b(1,i)=mean(AllProblems{1}(15+i).fvalGA,1);
    fD5b(2,i)=mean(AllProblems{1}(15+i).fvalPSO,1);
    fD5b(3,i)=AllProblems{1}(15+i).fvalSQP;
    
    
    fD10a(1,i)=mean(AllProblems{2}(i).fvalGA,1);
    fD10a(2,i)=mean(AllProblems{2}(i).fvalPSO,1);
    fD10a(3,i)=AllProblems{2}(i).fvalSQP;
    
    fD10b(1,i)=mean(AllProblems{2}(15+i).fvalGA,1);
    fD10b(2,i)=mean(AllProblems{2}(15+i).fvalPSO,1);
    fD10b(3,i)=AllProblems{2}(15+i).fvalSQP;
    
    
    fD30a(1,i)=mean(AllProblems{3}(i).fvalGA,1);
    fD30a(2,i)=mean(AllProblems{3}(i).fvalPSO,1);
    fD30a(3,i)=AllProblems{3}(i).fvalSQP;
    
    fD30b(1,i)=mean(AllProblems{3}(15+i).fvalGA,1);
    fD30b(2,i)=mean(AllProblems{3}(15+i).fvalPSO,1);
    fD30b(3,i)=AllProblems{3}(15+i).fvalSQP;
    
    
    fD50a(1,i)=mean(AllProblems{4}(i).fvalGA,1);
    fD50a(2,i)=mean(AllProblems{4}(i).fvalPSO,1);
    fD50a(3,i)=AllProblems{4}(i).fvalSQP;
    
    fD50b(1,i)=mean(AllProblems{4}(15+i).fvalGA,1);
    fD50b(2,i)=mean(AllProblems{4}(15+i).fvalPSO,1);
    fD50b(3,i)=AllProblems{4}(15+i).fvalSQP;
end


Xa = categorical({'F01','F02','F03','F04','F05','F06','F07','F08','F09','F10','F11','F12','F13','F14','F15'});
Xa = reordercats(Xa,{'F01','F02','F03','F04','F05','F06','F07','F08','F09','F10','F11','F12','F13','F14','F15'});

Xb = categorical({'F16','F17','F18','F19','F20','F21','F22','F23','F24','F25','F26','F27','F28','F29','F30'});
Xb = reordercats(Xb,{'F16','F17','F18','F19','F20','F21','F22','F23','F24','F25','F26','F27','F28','F29','F30'});

Limit5=100000
Limit10=100000
Limit30=100000
Limit50=100000


figure(1) % for D=5, D=10
subplot(4,1,1)
bara=bar(Xa,fD5a') % Dim 5, first 15
set(bara, {'DisplayName'}, {'GA','PSO','SQP'}')
ylim([0 Limit5])
set(gca,'YScale','log')
title('D=5', 'Interpreter', 'none') % Title of the subfigure
ylabel('Obj. fun. value');

subplot(4,1,2)
bara=bar(Xb,fD5b') % Dim 5, next 15
set(bara, {'DisplayName'}, {'GA','PSO','SQP'}')
ylim([0 Limit5])
set(gca,'YScale','log')
title('', 'Interpreter', 'none') % Title of the subfigure
ylabel('Obj. fun. value');

subplot(4,1,3)
bara=bar(Xa,fD10a') % Dim 10, first 15
set(bara, {'DisplayName'}, {'GA','PSO','SQP'}')
set(gca,'YScale','log')
title('D=10', 'Interpreter', 'none') % Title of the subfigure
ylabel('Obj. fun. value');
ylim([0 Limit10])

subplot(4,1,4)
bara=bar(Xb,fD10b') % Dim 10, next 15
set(bara, {'DisplayName'}, {'GA','PSO','SQP'}')
set(gca,'YScale','log')
title('', 'Interpreter', 'none') % Title of the subfigure
ylabel('Obj. fun. value');
legend('location','best')
ylim([0 Limit10])



figureTitle='FunctionValues5_10'
set(gcf, 'Position',  [0, 0, 800, 1200]); % Position the figures on the screen
    f = gcf;
    
saveas(gcf,append(currentFolder,'\Figures\OptiFunctionValues\',figureTitle, '.fig'))
exportgraphics(f,append(currentFolder,'\Figures\OptiFunctionValues\',figureTitle, '.emf'))
exportgraphics(f,append(currentFolder,'\Figures\OptiFunctionValues\',figureTitle, '.png'),'Resolution',300)



figure(2)  % for D=30, D=50
subplot(4,1,1)
bara=bar(Xa,fD30a') % Dim 30, first 15
set(bara, {'DisplayName'}, {'GA','PSO','SQP'}')
ylim([0 Limit30])
set(gca,'YScale','log')
title('D=30', 'Interpreter', 'none') % Title of the subfigure
ylabel('Obj. fun. value');

subplot(4,1,2)
bara=bar(Xb,fD30b') % Dim 30, next 15
set(bara, {'DisplayName'}, {'GA','PSO','SQP'}')
ylim([0 Limit30])
set(gca,'YScale','log')
title('', 'Interpreter', 'none') % Title of the subfigure
ylabel('Obj. fun. value');

subplot(4,1,3)
bara=bar(Xa,fD50a') % Dim 50, first 15
set(bara, {'DisplayName'}, {'GA','PSO','SQP'}')
set(gca,'YScale','log')
title('D=50', 'Interpreter', 'none') % Title of the subfigure
ylabel('Obj. fun. value');
ylim([0 Limit50])

%custom colors because we skipped PRS which was the 4th color

subplot(4,1,4)
bara=bar(Xb,fD50b') % Dim 50, next 15
set(bara, {'DisplayName'}, {'GA','PSO','SQP'}')
set(gca,'YScale','log')
title('', 'Interpreter', 'none') % Title of the subfigure
ylabel('Obj. fun. value');
legend('location','best')
ylim([0 Limit50])


figureTitle='FunctionValues30_50'
set(gcf, 'Position',  [0, 0, 800, 1200]); % Position the figures on the screen
    f = gcf;
    
saveas(gcf,append(currentFolder,'\Figures\OptiFunctionValues\',figureTitle, '.fig'))
exportgraphics(f,append(currentFolder,'\Figures\OptiFunctionValues\',figureTitle, '.emf'))
exportgraphics(f,append(currentFolder,'\Figures\OptiFunctionValues\',figureTitle, '.png'),'Resolution',300)



%% Time needed for each algorithm

%DIM 5 time
for i=1:15;
    GA5timea(i)=AllTimes{1}(i).GA/NumRuns;
    PSO5timea(i)=AllTimes{1}(i).PSO/NumRuns;
    SQP5timea(i)=AllTimes{1}(i).SQP;
end
DIM5time=[GA5timea;PSO5timea;SQP5timea]'

%DIM 10 time
for i=1:15;
    GA10timea(i)=AllTimes{2}(i).GA/NumRuns;
    PSO10timea(i)=AllTimes{2}(i).PSO/NumRuns;
    SQP10timea(i)=AllTimes{2}(i).SQP;

end
DIM10time=[GA10timea;PSO10timea;SQP10timea]'

%DIM 30 time
for i=1:15;
    GA30timea(i)=AllTimes{3}(i).GA/NumRuns;
    PSO30timea(i)=AllTimes{3}(i).PSO/NumRuns;
    SQP30timea(i)=AllTimes{3}(i).SQP;

end
DIM30time=[GA30timea;PSO30timea;SQP30timea]'

%DIM 50 time
for i=1:15;
    GA50timea(i)=AllTimes{4}(i).GA/NumRuns;
    PSO50timea(i)=AllTimes{4}(i).PSO/NumRuns;
    SQP50timea(i)=AllTimes{4}(i).SQP;

end
DIM50time=[GA50timea;PSO50timea;SQP50timea]'


figure(3) % Time for each algorithm for 1 run
subplot(4,1,1)
b=bar(Xa,DIM5time')
set(b, {'DisplayName'}, {'GA','PSO','SQP'}')
set(gca,'YScale','log')
title('D=5', 'Interpreter', 'none') % Title of the subfigure
ylabel('Time (sec)');
legend('location','NorthEast')

subplot(4,1,2)
b=bar(Xa,DIM10time')
set(b, {'DisplayName'}, {'GA','PSO','SQP'}')
set(gca,'YScale','log')
title('D=10', 'Interpreter', 'none') % Title of the subfigure
ylabel('Time (sec)');
% ylim([0 10])

subplot(4,1,3)
b=bar(Xa,DIM30time')
set(b, {'DisplayName'}, {'GA','PSO','SQP'}')
set(gca,'YScale','log')
title('D=30', 'Interpreter', 'none') % Title of the subfigure
ylabel('Time (sec)');
% ylim([0 10])


subplot(4,1,4)
b=bar(Xa,DIM50time')
set(b, {'DisplayName'}, {'GA','PSO','SQP'}')
set(gca,'YScale','log')
title('D=50', 'Interpreter', 'none') % Title of the subfigure
ylabel('Time (sec)');


figureTitle='OptiTimes'
set(gcf, 'Position',  [100, 100, 800, 1200]); % Position the figures on the screen
    f = gcf;
    
saveas(gcf,append(currentFolder,'\Figures\OptiTimes\',figureTitle, '.fig'))
exportgraphics(f,append(currentFolder,'\Figures\OptiTimes\',figureTitle, '.emf'))
exportgraphics(f,append(currentFolder,'\Figures\OptiTimes\',figureTitle, '.png'),'Resolution',300)
