close all;
%aflow = xlsread('Wetlevel.xlsx','afflow');
%nflow = xlsread('Wetlevel.xlsx','normflow');
%sens = xlsread('Wetlevel.xlsx','Sensitiv2');


base = sens(2:end,4);
tims = getdate(base,1);

bound = [];
bound = cat(1,bound,1);
for i = 1:width(sens(1,:))-1
    if sens(1,i+1) <= sens(1,i)
        bound = cat(1,bound,i);
        bound = cat(1,bound,i+1);
    end
end    
bound = cat(1,bound,211);

%%Strickler ---------------------------------------------------
getgraph(sens,bound(1:4),1.49,"Strickler overland flow (m^⅓/s)")
getgraph(sens,bound(5:8),0.862,"Strickler overland flow (m^⅓/s)")
getgraph(sens,bound(9:12),0.79,"Strickler overland flow (m^⅓/s)")
getgraph(sens,bound(13:16),,"Strickler overland flow (m^⅓/s)")
getgraph(sens,bound(17:20),0.790,"Strickler overland flow (m^⅓/s)")
getgraph(sens,bound(21:24),1.83,"Strickler overland flow (m^⅓/s)")
getgraph(sens,bound(25:28),0.6,"Strickler overland flow (m^⅓/s)")


function getgraph(sens,bound,modelbest,xlab)
%flow total
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(1):bound(2)));
    
figure('Name','Maxmin Strickler','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
yyaxis left 
plot(valueT,maxflow);
hold on
yyaxis right
plot(valueT,minflow)
h = xline(modelbest,'color','blue','linestyle',':');
yyaxis right

plot(valueT,minflow)
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(3):bound(4)));
yyaxis left 
ylabel("Peak flow (m^3/s)")
plot(valueT,maxflow,'--');
yyaxis right
plot(valueT,minflow,'--')
hold off
s1 = sprintf('%s',xlab);
s2 = sprintf('Model best = %0.3f',modelbest);
xlabel(s1)
ylabel("Minimum flow (m^3/s)")
legend(h,{s2},'location','north')
xlim([min(valueT) max(valueT)])
end


function [tf,maxflow,minflow,valueT,meanflow] = getvals(value)
    W = width(value);
    tf = zeros(W,1);
    maxflow = zeros(W,1);
    minflow = zeros(W,1);
    meanflow = zeros(W,1);
    valueT = value(1,1:W);
    value = value(100:end,1:W);
    for i = 1:W
        fval = value(:,i);
        tf(i)=sum(fval);
        maxflow(i) =  max(fval);
        minflow(i) = min(fval);
        meanflow(i) = mean(fval);
    end
end    




function dt2 = getdate(simhour,step)
    dt = datetime(2014,1,4);
    dt2 = dt + hours(1:step:(length(simhour))*step);


end