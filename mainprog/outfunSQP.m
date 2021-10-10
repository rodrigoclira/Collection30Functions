 function stop = outfunSQP(x,optimValues,state)
 global historySQP
 
 stop = false;
 
	switch state
        case 'init'
             %hold on         % Concatenate current point and objective function
         % value with history. x must be a row vector.
         
         


        case 'iter'
            historySQP.fval = [historySQP.fval; optimValues.fval];
            historySQP.x = [historySQP.x; x];
            historySQP.objcount = [historySQP.objcount; optimValues.funccount];       
%          % Concatenate current search direction with 
%          % searchdir.
%          
%          
%            searchdir = [searchdir;... 
%                         optimValues.searchdirection'];
%            plot(x(1),x(2),'o');
%            
%            
%          % Label points with iteration number and add title.
%          % Add .15 to x(1) to separate label from plotted 'o'.
%            text(x(1)+.15,x(2),... 
%                 num2str(optimValues.iteration));
%            title('Sequence of Points Computed by fmincon');
         case 'done'
             hold off
         otherwise
     end
 end