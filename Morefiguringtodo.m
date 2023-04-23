close all;
%aflow = xlsread('Wetlevel.xlsx','afflow');
%nflow = xlsread('Wetlevel.xlsx','normflow');
%sens = xlsread('Wetlevel.xlsx','Sensitiv3');
%PETS = table2array(importfile("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\PETtimeseries.csv", [1, Inf]));
%rainS = table2array(importfile2("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\rainfalltimeseries.csv", [1, Inf]));
%simn = nflow(1:544,1);
%simaf = nflow(1:544,2);

%hrflow = table2array(importfile3("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\24hrflow.txt", [1, Inf]));
hrflow= hrflow(1:544);
tim24 = getdate(hrflow,24);


PETS = PETS(2:end);
rainS = rainS(2:end);
PET = zeros(24*height(PETS),1);
rain =  zeros(24*height(PETS),1);
for i = 1:height(PETS)
    PET([1+(24*(i-1)):24*i])=PETS(i);
    rain([1+(24*(i-1)):24*i])=rainS(i);
end
PET = PET(1:height(sens));
rain = rain(1:height(sens));


base = sens(2:end,7);
tims = getdate(base,1);

bound = [];
bound = cat(1,bound,1);
for i = 1:width(sens(1,:))-1
    if sens(1,i+1) <= sens(1,i)
        bound = cat(1,bound,i);
        bound = cat(1,bound,i+1);
    end
end    
bound = cat(1,bound,width(sens(1,:)));
%%Strickler ---------------------------------------------------

%flow total
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(1):bound(2)));
    
figure('Name','Maxmin Strickler','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
yyaxis left 
h(1) =plot(valueT,maxflow);
hold on
yyaxis right
plot(valueT,minflow)
h(3) = xline(1.486,'color','blue','linestyle',':');
yyaxis right

plot(valueT,minflow)
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(3):bound(4)));
yyaxis left 
ylabel("Peak flow (m^3/s)")
h(2) = plot(valueT,maxflow,'--');
yyaxis right
plot(valueT,minflow,'--')
hold off
xlabel("Strickler overland flow (m^⅓/s)")
ylabel("Low flow (m^3/s)")
legend(h(3),{'Sim Best = 1.486'},'location','best')
xlim([min(valueT) max(valueT)])

%%Leaf Cannopy Storage ---------------------------------------------

%flow total
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(5):bound(6)));
    
figure('Name','Maxmin LeafS','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
yyaxis left 
h(1) =plot(5*valueT,maxflow);
hold on
yyaxis right
plot(5.*valueT,minflow)
h(3) = xline(4.310,'color','blue','linestyle',':');
yyaxis right
plot(5.*valueT,minflow)
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(7):bound(8)));
yyaxis left 
ylabel("Peak flow (m^3/s)")
h(2) = plot(5.*valueT,maxflow,'--');
yyaxis right
plot(5.*valueT,minflow,'--')
hold off
xlabel("Cannopy storage (mm)")
ylabel("Low flow (m^3/s)")
legend(h(3),{'Sim Best = 4.310'},'location','best')
xlim([min(5.*valueT) max(5.*valueT)])
%%LeafA ------------------------------------------------------
figure('Name','Maxmin LeafA','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
yyaxis left 
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(9):bound(10)));
h(1) =plot(6.*valueT,maxflow);
hold on
yyaxis right
plot(6.*valueT,minflow)
h(3) = xline(4.743,'color','blue','linestyle',':');

[~,maxflow,minflow,valueT] = getvals(sens(:,bound(11):bound(12)));
yyaxis left 
ylabel("Peak flow (m^3/s)")
h(2) = plot(6.*valueT,maxflow,'--');
yyaxis right
plot(6.*valueT,minflow,'--')
hold off
xlabel("Leaf area index")
ylabel("Low flow (m^3/s)")
legend(h(3),{'Sim Best = 4.743'},'location','best')
xlim([min(6.*valueT) max(6.*valueT)])
%%Cond -------------------------------------------------------------
figure('Name','Maxmin Cond','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(13):bound(14)));
yyaxis left 
h(1) =plot(valueT,maxflow);
hold on
yyaxis right
h(3) = xline(0.6,'color','blue','linestyle',':');
plot(valueT,minflow)
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(15):bound(16)));
yyaxis left 
ylabel("Peak flow (m^3/s)")
h(2) = plot(valueT,maxflow,'--');
yyaxis right
plot(valueT,minflow,'--')
hold off
xlabel("Saturated conductivity (m/day)")
ylabel("Low flow (m^3/s)")
legend(h(3),{'Sim Best = 0.6'},'location','best')
xlim([min(valueT) max(valueT)])

%%SoilD -------------------------------------------------------------
figure('Name','Maxmin SoilD','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(17):bound(18)));
h(1) =plot(valueT,maxflow);
hold on
yyaxis right
plot(valueT,minflow)
h(3) = xline(2.669,'color','blue','linestyle',':');
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(19):bound(20)));
yyaxis left 
ylabel("Peak flow (m^3/s)")
h(2) = plot(valueT,maxflow,'--');
yyaxis right
plot(valueT,minflow,'--')
hold off
xlabel("Soil depth (m)")
ylabel("Low flow (m^3/s)")
legend(h(3),{'Sim Best = 2.669'},'location','best')
xlim([min(valueT) max(valueT)])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)

%%PEtree -------------------------------------------------------------
figure('Name','Maxmin PeTree','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(21):bound(22)));
yyaxis left
h(1) =plot(valueT,maxflow);
hold on
yyaxis right
plot(valueT,minflow)
h(3) = xline(1.857,'color','blue','linestyle',':');
[tf,maxflow,minflow,valueT] = getvals(sens(:,bound(23):bound(24)));
yyaxis left 
ylabel("Peak flow (m^3/s)")
h(2) = plot(valueT,maxflow,'--');
yyaxis right
plot(valueT,minflow,'--')
hold off
xlabel("Tree P/E ratio")
ylabel("Low flow (m^3/s)")
legend(h(3),{'Sim Best = 1.867'},'location','best')
xlim([min(valueT) max(valueT)])
%%TreeRoot -------------------------------------------------------------
figure('Name','Maxmin Treeroot','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
[~,maxflow,minflow,valueT,m] = getvals(sens(:,bound(25):bound(26)))
yyaxis left 

h(1) =plot(valueT,maxflow);
hold on
%plot(valueT,m,'g');
yyaxis right
plot(valueT,minflow)
h(3) = xline(1.7,'color','blue','linestyle',':');
[tf,maxflow,minflow,valueT] = getvals(sens(:,bound(27):bound(27)+1));
yyaxis left 
ylabel("Peak flow (m^3/s)")
h(2) = plot(valueT,maxflow,'--');
yyaxis right
plot(valueT,minflow,'--')
hold off
xlabel("Root depth (m)")
ylabel("Low flow (m^3/s)")
legend(h(3),{'Sim Best = 1.7'},'location','best')
xlim([min(valueT) max(valueT)])

%%TreeRoot -------------------------------------------------------------
figure('Name','Maxmin Grids','defaultAxesColorOrder',[[0 0 0]; [1 0 0]])
set(gca,'FontName','Times new roman','fontsize',10,'linewidth',1.2)
[~,maxflow,minflow,valueT] = getvals(sens(:,bound(28)-1:bound(28)));
yyaxis left 
h(1) =plot(valueT,maxflow);
hold on
yyaxis right
plot(valueT,minflow)
h(3) = xline(29.12,'color','blue','linestyle',':');
[tf,maxflow,minflow,valueT] = getvals(sens(:,bound(29):bound(30)));
yyaxis left 
ylabel("Peak flow (m^3/s)")
h(2) = plot(valueT,maxflow,'--');
yyaxis right
plot(valueT,minflow,'--')
hold off
xlabel("Grids to form channel")
ylabel("Low flow (m^3/s)")
legend(h(3),{'Sim Best = 29.12'},'location','best')
xlim([min(valueT) max(valueT)])


%% Main
figure('Name','Timeseries','defaultAxesColorOrder',[[0 0 0]; [0 0 1]])
set(gca,'FontName','Times new roman','fontsize',12,'linewidth',1.2)
hold on;
plot(tims(100:end),base(100:end),'k')
dt = datetime(2014,1,4);
dt2 = dt + hours(730.3*[3,7,11,15]);
axis tight
ylabel("Hourly discharge (cumecs)")
for i = 1:length(dt2)
    xline(dt2(i),'r')
end
yyaxis right
ylim([0 120])
ylabel("Daily rainfall (mm)")
set(gca, 'YDir','reverse')
bar(tims(100:end),rain(101:end))

%linestyles = ['-', '--', ':', '-.'];
%for i = 1:4
%plot(tims,conddiff(:,i),'LineStyle',linestyles(i))
%hold on
%end


figure()
plot(tim24(5:end),hrflow(4:end-1))
hold on
plot(tim24(4:end),simn(4:end))
plot(tim24(4:end),simaf(4:end))
ylabel('Daily average discharge (cumecs)')
yyaxis right
set(gca, 'YDir','reverse')
ylabel('Potential evapotranspiration (mm/day)')
bar(tim24(4:end),PETS(4:544))
ylim([0 10])
legend('CAMELS data',"Normal",'Afforested')
set(gca,'FontName','Times new roman','fontsize',12,'linewidth',1.2)


%%FUNCTIONS FUNCTIONS FUNCTIONS FUNCTIONS




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


function PETtimeseries = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  PETTIMESERIES = IMPORTFILE(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as a table.
%
%  PETTIMESERIES = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  PETtimeseries = importfile("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\PETtimeseries.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 16-Apr-2023 18:24:52

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 10, "Encoding", "UTF-8");

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10"];
opts.SelectedVariableNames = "VarName1";
opts.VariableTypes = ["double", "string", "string", "string", "string", "string", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10"], "EmptyFieldRule", "auto");

% Import the data
PETtimeseries = readtable(filename, opts);

end

function rainfalltimeseries = importfile2(filename, dataLines)
%IMPORTFILE Import data from a text file
%  RAINFALLTIMESERIES = IMPORTFILE(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as a table.
%
%  RAINFALLTIMESERIES = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  rainfalltimeseries = importfile2("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\rainfalltimeseries.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 16-Apr-2023 18:26:16

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 8, "Encoding", "UTF-8");

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8"];
opts.SelectedVariableNames = "VarName1";
opts.VariableTypes = ["double", "string", "string", "string", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8"], "EmptyFieldRule", "auto");

% Import the data
rainfalltimeseries = readtable(filename, opts);

end

function hrflow = importfile3(filename, dataLines)
%IMPORTFILE Import data from a text file
%  HRFLOW = IMPORTFILE(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a table.
%
%  HRFLOW = IMPORTFILE(FILE, DATALINES) reads data for the specified row
%  interval(s) of text file FILENAME. Specify DATALINES as a positive
%  scalar integer or a N-by-2 array of positive scalar integers for
%  dis-contiguous row intervals.
%
%  Example:
%  hrflow = importfile("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\24hrflow.txt", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 16-Apr-2023 22:24:41

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 1);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = "VarName1";
opts.VariableTypes = "double";

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
hrflow = readtable(filename, opts);

end