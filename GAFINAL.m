%genetic algorithm

import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
results = [];
Timer = 0;
global count
count = 0;

resultstrick = [];
resultleafs= [];
resultleafa= [];
resultcond= [];
resultsoild= [];
resultpetree= [];
resultroot= [];
resultgrid = []


fclose('all');
%water,leafS,leafA,root,strickler,soildepth
%x=[2.974861309	0.017830113	0.854819069	1.373519817	1.098894971	16.063601652	1.658030306	25.74012542	28.2960516	16.07278004	1.572660548	0.164051502];
%x=[1.485658906	0.32522347	0.861970504	0.790462589	1.825816977	0.6	2.669068276	29.1226908	32.34078421	13.78609383	1.857321453	0.159549629];
x = [1.960141747    2.482515887	31.81288238	34.87245107	18.34376574	1.517978457	0.185127873];
x(1)= 2;    %strickler = string(2);
x(2) = 0;    %watertable = 0;
x(3) = 0.75;    %leafS = 0.75;
x(4) = 0.75;    %leafA = 0.75;
x(5) = 1;    %root = 1;
x(6) = 2.1;    %conductivity = 3;
x(7) = 1.5;    %soild = 1.6;
x(8) = 25;    %grid = 25;
x(9) = 18;    %griddrop = 18;
x(10) = 15;    %chandrop = 15;
x(11) = 1;    %PEtree = base is 1
x(12) =0.1;   %PEother = base is 0.1
x(13) = 1.7; %root tree

options = optimoptions('ga','PopulationSize',1,'MaxGenerations',1,'PlotFcn', @gaplotbestf);
gate1 = x;
fun = @geneticy;
fun2 = @calib;
%[gate1,geninp,exitflag,gendat] = ga(fun,13,[],[],[],[],[1,1,8,8,8,0.5,0.05],[6,3,40,40,20,2,0.2],[],options);
%[gate1,geninp,exitflag,gendat] = ga(fun,13,[],[],[],[],[1	0	0.4	0.4	0.1	0.45	1	10	10	10	1	0.01	0.1],[10	2	2	2	3	0.6	3	50	50	50	3	0.1	x(7)],[],options);
%[gate1,geninp,exitflag,gendat] = ga(fun2,13,[],[],[],[],[1	0	0.4	0.4	0.1	0.45	1	10	10	10	1	0.01	0.1],[10	2	2	2	3	0.6	3	50	50	50	3	0.1	x(7)],[],options);
%best = geneticy(gate1);
%[gate1,geninp,exitflag,gendat] = ga(fun,13,[],[],[],[],[1	0	0.4	0.4	0.1	0.45	1	10	10	10	1	0.01	0.1],[10	2	2	2	3	0.6	3	50	50	50	3	0.1	x(7)],[],options);


gate1 = [1.683700225	0.119559086	0.597373742	1.923132875	1.315511187	0.5041973	2.459844282	49.91898219	27.67197872	12.10707991	2.965326799	0.052383183	0.940771516];

x = gate1;


%disp(length([1,1.1,1.2,1.3,1.485658906,1.5,1.6,1.6837,1.8,2,2.3,2.5,2.8,0.1,0.2,0.5,0.59734,0.75,0.861970504,1,1.5,2,2.5,5,7.5,0.1,0.3,0.5,0.7,0.79,0.8,0.9,1,1.5,1.92311,2,2.1,2.2,2.3,2.6,3,0.1,0.15,0.2,0.4,0.5,0.55,0.598197,0.6,0.65,0.7,0.75,0.8,1,0.5,1,1.25,1.5,1.75,2,2.4,2.459844,2.5,2.6,2.669068,2.7,2.8,3,3.5,5,0.5,0.6,0.7,0.8,0.9,1,1.2,1.4,1.6,1.8,1.857321453,2,2.5,3,3.5,3.7,4,4.5,5,6,8,10,10,14,16,18,20,22,25,27,30,32,34,37,40,45,48,50,52,55,60,65,0.1,0.2,0.3,0.4,0.6,0.8,0.9,0.940772,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.2,2.3,2.4,2.5,2.6]));
%resultstrick = cat(2,resultstrick,sens(x,1,[1,1.1,1.2,1.3,1.485658906,1.5,1.6,1.6837,1.8,2,2.3,2.5,2.8],0));
%resultstrick = cat(2,resultstrick,sens(x,1,[1,1.1,1.2,1.3,1.485658906,1.5,1.6,1.6837,1.8,2,2.3,2.5,2.8],1));
%resultleafs = cat(2,resultleafs,sens(x,3,[0.1,0.2,0.5,0.59734,0.75,0.861970504,1,1.5,2,2.5,5,7.5],0));
%resultleafs = cat(2,resultleafs,sens(x,3,[0.1,0.2,0.5,0.59734,0.75,0.861970504,0.9,1,1.5,2,2.5,5,7.5],1));
%resultleafa = cat(2,resultleafa,sens(x,4,[0.1,0.3,0.5,0.7,0.79,0.8,0.9,1,1.5,1.92311,2,2.1,2.2,2.3,2.6,3],0));
%resultleafa = cat(2,resultleafa,sens(x,4,[0.1,0.3,0.5,0.7,0.79,0.8,0.9,1,1.5,1.92311,2,2.1,2.2,2.3,2.6,3],1));
%resultcond = cat(2,resultcond,sens(x,6,[0.1,0.15,0.2,0.4,0.5,0.55,0.598197,0.6,0.65,0.7,0.75,0.8,1],0));
%resultcond = cat(2,resultcond,sens(x,6,[0.1,0.15,0.2,0.4,0.5,0.55,0.598197,0.6,0.65,0.7,0.75,0.8,1],1));
%resultsoild = cat(2,resultsoild,sens(x,7,[0.5,1,1.25,1.5,1.75,2,2.4,2.459844,2.5,2.6,2.669068,2.7,2.8,3,3.5,5],0));
%resultsoild = cat(2,resultsoild,sens(x,7,[0.5,1,1.25,1.5,1.75,2,2.4,2.459844,2.5,2.6,2.669068,2.7,2.8,3,3.5,5],1));
%resultpetree = cat(2,resultpetree,sens(x,11,[0.5,0.6,0.7,0.8,0.9,1,1.2,1.4,1.6,1.8,1.857321453,2,2.5,3,3.5,3.7,4,4.5,5,6,8,10],0));
%resultpetree = cat(2,resultpetree,sens(x,11,[0.5,0.6,0.7,0.8,0.9,1,1.2,1.4,1.6,1.8,1.857321453,2,2.5,3,3.5,3.7,4,4.5,5,6,8,10],1));
%resultgrid = cat(2,resultgrid,sens(x,8,[10,14,16,18,20,22,25,27,30,32,34,37,40,45,48,50,52,55,60,65],0));
%resultgrid = cat(2,resultgrid,sens(x,8,[10,14,16,18,20,22,25,27,30,32,34,37,40,45,48,50,52,55,60,65],1));
%resultroot = cat(2,resultroot,sens(x,13,[0.1,0.2,0.3,0.4,0.6,0.8,0.9,0.940772,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.2,2.3,2.4,2.5,2.6],0));
%resultroot = cat(2,resultroot,sens(x,13,[0.1,0.2,0.3,0.4,0.6,0.8,0.9,0.940772,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.2,2.3,2.4,2.5,2.6],1));
%nflow = sens(x,13,x(13),0);
%aflow = sens24(x,13,x(13),1);

%results = cat(2,resultstrick,resultleafs,resultleafa,resultcond,resultsoild,resultpetree,resultroot,resultgrid);
%resultsfinflow = cat(2,nflow,aflow);

[NNSE,timestep24calib,hrflow24calib] = calib(x);
disp(NNSE)
figure()
plot(timestep24calib,'k')
hold on
plot(hrflow24calib,'r','linestyle',':')

function vale = geneticy(x)

    import java.awt.Robot;
    import java.awt.event.*;
    disp("x= "+x)
    tic
    global count
    count = count+1;
    %set variables



    %watertable,leafS*5,leafA*6,root*2,strickler conductivity soild
    %ga variables ---------------------------------------
    strickler = x(1);%string(x(1));
    watertable = x(2);%0.33;
    leafS = x(3);%50.879;
    leafA = x(4);%0.86;
    root = x(5);%1.8;
    conductivity = x(6);%0.65;
    soild = x(7);
    grid = x(8);
    griddrop = x(9);
    chandrop = x(10);
    PEtree = x(11);
    PEother = x(12);
    treeroots = x(13);





    RC = fopen('Jmatlabmodel.xml','w');

    fprintf(RC,'<?xml version="1.0"?><ShetranInput>\n');
    fprintf(RC,'<ProjectFile>Jmatlabmodel.xml</ProjectFile>\n');
    fprintf(RC,'<CatchmentName>East</CatchmentName>\n');
    fprintf(RC,'<DEMMeanFileName>demnosinks.txt</DEMMeanFileName>\n');
    fprintf(RC,'<DEMminFileName>DEMwithsinks36x50.txt<DEMminFileName>\n');
    fprintf(RC,'<MaskFileName>catchmymask - Copy.txt</MaskFileName>\n');
    fprintf(RC,'<VegMap>landuse36x50.txt</VegMap>\n');
    fprintf(RC,'<SoilMap>catchmymask - Copy.txt</SoilMap>\n');
    fprintf(RC,'<LakeMap></LakeMap>\n');
    fprintf(RC,'<PrecipMap>Raincatchment.txt</PrecipMap>\n');
    fprintf(RC,'<PeMap>PETcatchment.txt</PeMap>\n');
    fprintf(RC,'<VegetationDetails><VegetationDetail>Veg Type #, Vegetation Type, Canopy storage capacity (mm), Leaf area index, Maximum rooting depth(m), AE/PE at field capacity,Strickler overland flow coefficient</VegetationDetail>\n');
    fprintf(RC,'<VegetationDetail>1,  EvergreenForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots*2),string(PEtree),string(strickler));
    fprintf(RC,'<VegetationDetail>2,  DeciduousForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots*1.5),string(PEtree),string(strickler));
    fprintf(RC,'<VegetationDetail>4,  ImprovedGrassArable,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA*4),string(root*0.8),string(PEother*5),string(strickler));
    fprintf(RC,'<VegetationDetail>6,  Urban,  0,  0.3,  %s,  0, %s</VegetationDetail>\n',string(root*0.5),string(strickler));
    fprintf(RC,'<VegetationDetail>7,  AcidGrassLand,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
    fprintf(RC,'<VegetationDetail>8,  Bog,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
    fprintf(RC,'</VegetationDetails>\n');
    fprintf(RC,'<SoilProperties>\n');
    fprintf(RC,'<SoilProperty>Soil Number,Soil Type, Saturated Water Content, Residual Water Content, Saturated Conductivity (m/day), vanGenuchten- alpha (cm-1), vanGenuchten-n</SoilProperty>\n');
    fprintf(RC,'<SoilProperty>1,SandyClayLoam(65Sand:24Clay), 0.461,   0.167, %s,   1.24E-02,  2</SoilProperty>\n',string(conductivity));
    fprintf(RC,'</SoilProperties>\n');
    fprintf(RC,'<SoilDetails>\n');
    fprintf(RC,'<SoilDetail>Soil Category, Soil Layer, Soil Type, Depth at base of layer (m)</SoilDetail>\n');
    fprintf(RC,'<SoilDetail>1, 1, 1, %s </SoilDetail>\n',string(soild));
    fprintf(RC,'</SoilDetails>\n');
    fprintf(RC,'<InitialConditions>%s</InitialConditions>\n',string(watertable));
    fprintf(RC,'<PrecipitationTimeSeriesData>rainfalltimeseries.csv</PrecipitationTimeSeriesData>\n');
    fprintf(RC,'<PrecipitationTimeStep>24</PrecipitationTimeStep>\n');
    fprintf(RC,'<EvaporationTimeSeriesData>PETtimeseries.csv</EvaporationTimeSeriesData>\n');
    fprintf(RC,'<EvaporationTimeStep>24</EvaporationTimeStep>\n');
    fprintf(RC,'<StartDay>1</StartDay>\n');
    fprintf(RC,'<StartMonth>1</StartMonth>\n');
    fprintf(RC,'<StartYear>2014</StartYear>\n');
    fprintf(RC,'<EndDay>28</EndDay>\n');
    fprintf(RC,'<EndMonth>5</EndMonth>\n');
    fprintf(RC,'<EndYear>2015</EndYear>\n');
    fprintf(RC,'<MinimumDropBetweenChannels>%s</MinimumDropBetweenChannels>\n',string(chandrop));
    fprintf(RC,'<RiverGridSquaresAccumulated>%s</RiverGridSquaresAccumulated>\n',string(grid));
    fprintf(RC,'<DropFromGridToChannelDepth>%s</DropFromGridToChannelDepth>\n',string(griddrop));
    fprintf(RC,'<RegularTimestep>1</RegularTimestep>\n');
    fprintf(RC,'<IncreasingTimestep>0.05</IncreasingTimestep>\n');
    fprintf(RC,'<SimulatedDischargeTimestep>24.0</SimulatedDischargeTimestep>\n');
    fprintf(RC,'</ShetranInput>');


    !"W:\Year 3\Research Project\Shetran Model\Shetran-standard-v4.4.5x64\easy setup\program\start.exe" &
    pause(0.3)
    import java.awt.event.KeyEvent;
    idealgf=Robot;
    idealgf.keyPress(KeyEvent.VK_J);
    pause(0.2)
    idealgf.keyPress(KeyEvent.VK_DOWN);
    pause(0.2)
    idealgf.keyPress(KeyEvent.VK_ENTER);
    pause(15)

    isready = 0;
    while isready == 0
        s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");         
        s1 = s.bytes;
        pause(3)
        s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");
        s2 = s.bytes;
        if s1 == s2
            isready = 1;
        end
    end     
%          
    system('TASKKILL -f -im "conhost.exe"');
    system('TASKKILL -f -im "start.exe"');           


    for d=1
        opts = delimitedTextImportOptions("NumVariables", 2);

        % Specify range and delimiter
        opts.DataLines = [2, Inf];
        opts.Delimiter = " ";

        % Specify column names and types
        opts.VariableNames = ["discharge", "Var2"];
        opts.SelectedVariableNames = "discharge";
        opts.VariableTypes = ["double", "string"];

        % Specify file level properties
        opts.ExtraColumnsRule = "ignore";
        opts.EmptyLineRule = "read";
        opts.ConsecutiveDelimitersRule = "join";
        opts.LeadingDelimitersRule = "ignore";

        % Specify variable properties
        opts = setvaropts(opts, "Var2", "WhitespaceRule", "preserve");
        opts = setvaropts(opts, "Var2", "EmptyFieldRule", "auto");
        opts = setvaropts(opts, "discharge", "TrimNonNumeric", true);
        opts = setvaropts(opts, "discharge", "ThousandsSeparator", ",");

        % Import the data

%% outputs
        timestep24 = table2array(readtable("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_regulartimestep.txt", opts));
        vale = sum(timestep24);   
        hrflow24 = table2array((readtable('24hrflow.txt')));
        lts24 = length(timestep24);
        hrflow24 = hrflow24(1:lts24);
        %corel =  corrcoef(timestep24,hrflow24);
        %vale = vale - sum(hrflow24);
        %timestep24 = cat(1,timestep24,root,PEtree,PEother,corel(2,1),vale);
        %results = cat(2,results,timestep24);
        %disp("Flow dif = "+vale)
        %disp("Corelcoff = "+corel(2,1))
        %vale = corel(2,1)*-1;

        s1 = 0;
        s2 = 0;
        NSEqtbar = mean(hrflow24);
        for kk = 1:length(hrflow24)
            s = (hrflow24(kk) - timestep24(kk))^2;
            s1 = s1+s;
            s = (hrflow24(kk)-NSEqtbar)^2;
            s2 = s2+s;
        end    
        NSE = 1-(s1/s2);
        NNSE = 1/(2-NSE);
        vale = -NNSE
        disp("-----------------")
    %% Clear temporary variables
        clear opts            
        Tims = toc;
        disp(Tims)
        disp("Iteration: "+count)



    end
end



function [NNSE,timestep24,hrflow24] = calib(x)

    import java.awt.Robot;
    import java.awt.event.*;
    disp("x= "+x)
    tic
    global count
    count = count+1;
    %set variables



    %watertable,leafS*5,leafA*6,root*2,strickler conductivity soild
    %ga variables ---------------------------------------
    strickler = x(1);%string(x(1));
    watertable = x(2);%0.33;
    leafS = x(3);%50.879;
    leafA = x(4);%0.86;
    root = x(5);%1.8;
    conductivity = x(6);%0.65;
    soild = x(7);
    grid = x(8);
    griddrop = x(9);
    chandrop = x(10);
    PEtree = x(11);
    PEother = x(12);
    treeroots = x(13);





    RC = fopen('Jmatlabmodel.xml','w');

    fprintf(RC,'<?xml version="1.0"?><ShetranInput>\n');
    fprintf(RC,'<ProjectFile>Jmatlabmodel.xml</ProjectFile>\n');
    fprintf(RC,'<CatchmentName>East</CatchmentName>\n');
    fprintf(RC,'<DEMMeanFileName>demnosinks.txt</DEMMeanFileName>\n');
    fprintf(RC,'<DEMminFileName>DEMwithsinks36x50.txt<DEMminFileName>\n');
    fprintf(RC,'<MaskFileName>catchmymask - Copy.txt</MaskFileName>\n');
    fprintf(RC,'<VegMap>landuse36x50.txt</VegMap>\n');
    fprintf(RC,'<SoilMap>catchmymask - Copy.txt</SoilMap>\n');
    fprintf(RC,'<LakeMap></LakeMap>\n');
    fprintf(RC,'<PrecipMap>Raincatchment.txt</PrecipMap>\n');
    fprintf(RC,'<PeMap>PETcatchment.txt</PeMap>\n');
    fprintf(RC,'<VegetationDetails><VegetationDetail>Veg Type #, Vegetation Type, Canopy storage capacity (mm), Leaf area index, Maximum rooting depth(m), AE/PE at field capacity,Strickler overland flow coefficient</VegetationDetail>\n');
    fprintf(RC,'<VegetationDetail>1,  EvergreenForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots*2),string(PEtree),string(strickler));
    fprintf(RC,'<VegetationDetail>2,  DeciduousForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots*1.5),string(PEtree),string(strickler));
    fprintf(RC,'<VegetationDetail>4,  ImprovedGrassArable,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA*4),string(root*0.8),string(PEother*5),string(strickler));
    fprintf(RC,'<VegetationDetail>6,  Urban,  0,  0.3,  %s,  0, %s</VegetationDetail>\n',string(root*0.5),string(strickler));
    fprintf(RC,'<VegetationDetail>7,  AcidGrassLand,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
    fprintf(RC,'<VegetationDetail>8,  Bog,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
    fprintf(RC,'</VegetationDetails>\n');
    fprintf(RC,'<SoilProperties>\n');
    fprintf(RC,'<SoilProperty>Soil Number,Soil Type, Saturated Water Content, Residual Water Content, Saturated Conductivity (m/day), vanGenuchten- alpha (cm-1), vanGenuchten-n</SoilProperty>\n');
    fprintf(RC,'<SoilProperty>1,SandyClayLoam(65Sand:24Clay), 0.461,   0.167, %s,   1.24E-02,  2</SoilProperty>\n',string(conductivity));
    fprintf(RC,'</SoilProperties>\n');
    fprintf(RC,'<SoilDetails>\n');
    fprintf(RC,'<SoilDetail>Soil Category, Soil Layer, Soil Type, Depth at base of layer (m)</SoilDetail>\n');
    fprintf(RC,'<SoilDetail>1, 1, 1, %s </SoilDetail>\n',string(soild));
    fprintf(RC,'</SoilDetails>\n');
    fprintf(RC,'<InitialConditions>%s</InitialConditions>\n',string(watertable));
    fprintf(RC,'<PrecipitationTimeSeriesData>rainfallcalib.csv</PrecipitationTimeSeriesData>\n');
    fprintf(RC,'<PrecipitationTimeStep>24</PrecipitationTimeStep>\n');
    fprintf(RC,'<EvaporationTimeSeriesData>PETcalib.csv</EvaporationTimeSeriesData>\n');
    fprintf(RC,'<EvaporationTimeStep>24</EvaporationTimeStep>\n');
    fprintf(RC,'<StartDay>1</StartDay>\n');
    fprintf(RC,'<StartMonth>1</StartMonth>\n');
    fprintf(RC,'<StartYear>2000</StartYear>\n');
    fprintf(RC,'<EndDay>31</EndDay>\n');
    fprintf(RC,'<EndMonth>12</EndMonth>\n');
    fprintf(RC,'<EndYear>2010</EndYear>\n');
    fprintf(RC,'<MinimumDropBetweenChannels>%s</MinimumDropBetweenChannels>\n',string(chandrop));
    fprintf(RC,'<RiverGridSquaresAccumulated>%s</RiverGridSquaresAccumulated>\n',string(grid));
    fprintf(RC,'<DropFromGridToChannelDepth>%s</DropFromGridToChannelDepth>\n',string(griddrop));
    fprintf(RC,'<RegularTimestep>1</RegularTimestep>\n');
    fprintf(RC,'<IncreasingTimestep>0.01</IncreasingTimestep>\n');
    fprintf(RC,'<SimulatedDischargeTimestep>24.0</SimulatedDischargeTimestep>\n');
    fprintf(RC,'</ShetranInput>');


    !"W:\Year 3\Research Project\Shetran Model\Shetran-standard-v4.4.5x64\easy setup\program\start.exe" &
    pause(0.3)
    idealgf=Robot;
    idealgf.keyPress(KeyEvent.VK_J);
    idealgf.keyPress(KeyEvent.VK_M);
    idealgf.keyPress(KeyEvent.VK_A);        
    idealgf.keyPress(KeyEvent.VK_T);
    idealgf.keyPress(KeyEvent.VK_L);
    idealgf.keyPress(KeyEvent.VK_A);
    idealgf.keyPress(KeyEvent.VK_B);
    idealgf.keyPress(KeyEvent.VK_M);
    idealgf.keyPress(KeyEvent.VK_O);
    idealgf.keyPress(KeyEvent.VK_D);
    idealgf.keyPress(KeyEvent.VK_E);
    idealgf.keyPress(KeyEvent.VK_L);
    idealgf.keyPress(KeyEvent.VK_PERIOD);
    idealgf.keyPress(KeyEvent.VK_X);
    idealgf.keyPress(KeyEvent.VK_M);
    idealgf.keyPress(KeyEvent.VK_L);
    idealgf.keyPress(KeyEvent.VK_ENTER);
    pause(30)

    isready = 0;
    while isready == 0
        s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");         
        s1 = s.bytes;
        pause(3)
        s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");
        s2 = s.bytes;
        if s1 == s2
            isready = 1;
        end
    end     
%          
    system('TASKKILL -f -im "conhost.exe"');
    system('TASKKILL -f -im "start.exe"');           


    for d=1
        opts = delimitedTextImportOptions("NumVariables", 2);

        % Specify range and delimiter
        opts.DataLines = [2, Inf];
        opts.Delimiter = " ";

        % Specify column names and types
        opts.VariableNames = ["discharge", "Var2"];
        opts.SelectedVariableNames = "discharge";
        opts.VariableTypes = ["double", "string"];

        % Specify file level properties
        opts.ExtraColumnsRule = "ignore";
        opts.EmptyLineRule = "read";
        opts.ConsecutiveDelimitersRule = "join";
        opts.LeadingDelimitersRule = "ignore";

        % Specify variable properties
        opts = setvaropts(opts, "Var2", "WhitespaceRule", "preserve");
        opts = setvaropts(opts, "Var2", "EmptyFieldRule", "auto");
        opts = setvaropts(opts, "discharge", "TrimNonNumeric", true);
        opts = setvaropts(opts, "discharge", "ThousandsSeparator", ",");

        % Import the data

%% outputs
        timestep24 = table2array(readtable("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_regulartimestep.txt", opts));
        %vale = sum(timestep24);   
        hrflow24 = table2array((readtable('24hrflowcalib.txt')));
        lts24 = length(timestep24);
        hrflow24 = hrflow24(1:lts24);
        %corel =  corrcoef(timestep24,hrflow24);
        %vale = vale - sum(hrflow24);
        %timestep24 = cat(1,timestep24,root,PEtree,PEother,corel(2,1),vale);
        %results = cat(2,results,timestep24);
        %disp("Flow dif = "+vale)
        %disp("Corelcoff = "+corel(2,1))
        %vale = corel(2,1)*-1;

        s1 = 0;
        s2 = 0;
        NSEqtbar = mean(hrflow24);
        for kk = 1:length(hrflow24)
            s = (hrflow24(kk) - timestep24(kk))^2;
            s1 = s1+s;
            s = (hrflow24(kk)-NSEqtbar)^2;
            s2 = s2+s;
        end    
        NSE = 1-(s1/s2);
        NNSE = 1/(2-NSE);
        disp("-----------------")
    %% Clear temporary variables
        clear opts            
        Tims = toc;
        disp(Tims)
        disp("Iteration: "+count)



    end
end

function results = sens(x,varying,params,tree)
    global count
    import java.awt.Robot;
    import java.awt.event.*;
    results = [];
    for i = 1:width(params)
        count = count+1
        x(varying) = params(i);
        %watertable,leafS*5,leafA*6,root*2,strickler conductivity soild
        %ga variables ---------------------------------------
        strickler = string(x(1));
        watertable = x(2);
        leafS = x(3);
        leafA = x(4);
        root = x(5);
        conductivity = x(6);
        soild = x(7);
        grid = x(8);
        griddrop = x(9);
        chandrop = x(10);
        PEtree = x(11);
        PEother = x(12);
        treeroots=x(13);
        %leafA = i;




        RC = fopen('Jmatlabmodel.xml','w');

        fprintf(RC,'<?xml version="1.0"?><ShetranInput>\n');
        fprintf(RC,'<ProjectFile>Jmatlabmodel.xml</ProjectFile>\n');
        fprintf(RC,'<CatchmentName>East</CatchmentName>\n');
        fprintf(RC,'<DEMMeanFileName>demnosinks.txt</DEMMeanFileName>\n');
        fprintf(RC,'<DEMminFileName>DEMwithsinks36x50.txt<DEMminFileName>\n');
        fprintf(RC,'<MaskFileName>catchmymask - Copy.txt</MaskFileName>\n');
        fprintf(RC,'<VegMap>landuse36x50.txt</VegMap>\n');
        fprintf(RC,'<SoilMap>catchmymask - Copy.txt</SoilMap>\n');
        fprintf(RC,'<LakeMap></LakeMap>\n');
        fprintf(RC,'<PrecipMap>Raincatchment.txt</PrecipMap>\n');
        fprintf(RC,'<PeMap>PETcatchment.txt</PeMap>\n');
        fprintf(RC,'<VegetationDetails><VegetationDetail>Veg Type #, Vegetation Type, Canopy storage capacity (mm), Leaf area index, Maximum rooting depth(m), AE/PE at field capacity,Strickler overland flow coefficient</VegetationDetail>\n');
        fprintf(RC,'<VegetationDetail>1,  EvergreenForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots),string(PEtree),string(strickler));
        fprintf(RC,'<VegetationDetail>2,  DeciduousForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots),string(PEtree),string(strickler));
        fprintf(RC,'<VegetationDetail>4,  ImprovedGrassArable,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA*4),string(root*0.8),string(PEother*5),string(strickler));
        fprintf(RC,'<VegetationDetail>6,  Urban,  0,  0.3,  %s,  0, %s</VegetationDetail>\n',string(root*0.5),string(strickler));
        fprintf(RC,'<VegetationDetail>7,  AcidGrassLand,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
        if tree == 1
            fprintf(RC,'<VegetationDetail>8,  Tree,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots),string(PEtree),string(strickler));
        else
            fprintf(RC,'<VegetationDetail>8,  Grass,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
        end    
        fprintf(RC,'</VegetationDetails>\n');
        fprintf(RC,'<SoilProperties>\n');
        fprintf(RC,'<SoilProperty>Soil Number,Soil Type, Saturated Water Content, Residual Water Content, Saturated Conductivity (m/day), vanGenuchten- alpha (cm-1), vanGenuchten-n</SoilProperty>\n');
        fprintf(RC,'<SoilProperty>1,SandyClayLoam(65Sand:24Clay), 0.461,   0.167, %s,   1.24E-02,  2</SoilProperty>\n',string(conductivity));
        fprintf(RC,'</SoilProperties>\n');
        fprintf(RC,'<SoilDetails>\n');
        fprintf(RC,'<SoilDetail>Soil Category, Soil Layer, Soil Type, Depth at base of layer (m)</SoilDetail>\n');
        fprintf(RC,'<SoilDetail>1, 1, 1, %s </SoilDetail>\n',string(soild));
        fprintf(RC,'</SoilDetails>\n');
        fprintf(RC,'<InitialConditions>%s</InitialConditions>\n',string(watertable));
        fprintf(RC,'<PrecipitationTimeSeriesData>rainfalltimeseries.csv</PrecipitationTimeSeriesData>\n');
        fprintf(RC,'<PrecipitationTimeStep>24</PrecipitationTimeStep>\n');
        fprintf(RC,'<EvaporationTimeSeriesData>PETtimeseries.csv</EvaporationTimeSeriesData>\n');
        fprintf(RC,'<EvaporationTimeStep>24</EvaporationTimeStep>\n');
        fprintf(RC,'<StartDay>1</StartDay>\n');
        fprintf(RC,'<StartMonth>1</StartMonth>\n');
        fprintf(RC,'<StartYear>2014</StartYear>\n');
        fprintf(RC,'<EndDay>28</EndDay>\n');
        fprintf(RC,'<EndMonth>6</EndMonth>\n');
        fprintf(RC,'<EndYear>2015</EndYear>\n');
        fprintf(RC,'<MinimumDropBetweenChannels>%s</MinimumDropBetweenChannels>\n',string(chandrop));
        fprintf(RC,'<RiverGridSquaresAccumulated>%s</RiverGridSquaresAccumulated>\n',string(grid));
        fprintf(RC,'<DropFromGridToChannelDepth>%s</DropFromGridToChannelDepth>\n',string(griddrop));
        fprintf(RC,'<RegularTimestep>1</RegularTimestep>\n');
        fprintf(RC,'<IncreasingTimestep>0.05</IncreasingTimestep>\n');
        fprintf(RC,'<SimulatedDischargeTimestep>1.0</SimulatedDischargeTimestep>\n');
        fprintf(RC,'</ShetranInput>');


        !"W:\Year 3\Research Project\Shetran Model\Shetran-standard-v4.4.5x64\easy setup\program\start.exe" &

        idealgf=Robot;
        idealgf.keyPress(KeyEvent.VK_J);
        idealgf.keyPress(KeyEvent.VK_M);
        idealgf.keyPress(KeyEvent.VK_A);        
        idealgf.keyPress(KeyEvent.VK_T);
        idealgf.keyPress(KeyEvent.VK_L);
        idealgf.keyPress(KeyEvent.VK_A);
        idealgf.keyPress(KeyEvent.VK_B);
        idealgf.keyPress(KeyEvent.VK_M);
        idealgf.keyPress(KeyEvent.VK_O);
        idealgf.keyPress(KeyEvent.VK_D);
        idealgf.keyPress(KeyEvent.VK_E);
        idealgf.keyPress(KeyEvent.VK_L);
        idealgf.keyPress(KeyEvent.VK_PERIOD);
        idealgf.keyPress(KeyEvent.VK_X);
        idealgf.keyPress(KeyEvent.VK_M);
        idealgf.keyPress(KeyEvent.VK_L);
        idealgf.keyPress(KeyEvent.VK_ENTER);
        pause(30)

        isready = 0;
        while isready == 0
            s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");         
            s1 = s.bytes;
            pause(3)
            s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");
            s2 = s.bytes;
            if s1 == s2
                isready = 1;
            end
        end     
    %          
        system('TASKKILL -f -im "conhost.exe"');
        system('TASKKILL -f -im "start.exe"');           


    %% outputs
            timestep24 = daystep() ;
            %simflow = sum(timestep24);   
            %hrflow24 = table2array((readtable('24hrflow.txt')));
            %lts24 = length(timestep24);
            %hrflow24 = hrflow24(1:lts24);
            %corel =  corrcoef(timestep24,hrflow24);
            %simflowdif = simflow - sum(hrflow24);
            %timestep1 = hourstep();
            %results2 = cat(1,timestep1(:,2),treeroots);
            %resultshourflow = cat(2,resultshourflow,results2);
            %resultshourtime = cat(2,resultshourtime,timestep1(:,1));
            %disp("Flow dif = "+simflowdif)
            %disp("Corelcoff = "+corel(2,1))
            %vale = corel(2,1)*-1;
            timestep24 = cat(1,x(varying),timestep24);
            results = cat(2,results,timestep24);
            disp("-----------------")


        %% Clear temporary variables
            clear opts            




    end
end

function results = sens24(x,varying,params,tree)
    global count
    import java.awt.Robot;
    import java.awt.event.*;
    results = [];
    for i = 1:width(params)
        count = count+1
        x(varying) = params(i);
        %watertable,leafS*5,leafA*6,root*2,strickler conductivity soild
        %ga variables ---------------------------------------
        strickler = string(x(1));
        watertable = x(2);
        leafS = x(3);
        leafA = x(4);
        root = x(5);
        conductivity = x(6);
        soild = x(7);
        grid = x(8);
        griddrop = x(9);
        chandrop = x(10);
        PEtree = x(11);
        PEother = x(12);
        treeroots=x(13);
        %leafA = i;




        RC = fopen('Jmatlabmodel.xml','w');

        fprintf(RC,'<?xml version="1.0"?><ShetranInput>\n');
        fprintf(RC,'<ProjectFile>Jmatlabmodel.xml</ProjectFile>\n');
        fprintf(RC,'<CatchmentName>East</CatchmentName>\n');
        fprintf(RC,'<DEMMeanFileName>demnosinks.txt</DEMMeanFileName>\n');
        fprintf(RC,'<DEMminFileName>DEMwithsinks36x50.txt<DEMminFileName>\n');
        fprintf(RC,'<MaskFileName>catchmymask - Copy.txt</MaskFileName>\n');
        fprintf(RC,'<VegMap>landuse36x50.txt</VegMap>\n');
        fprintf(RC,'<SoilMap>catchmymask - Copy.txt</SoilMap>\n');
        fprintf(RC,'<LakeMap></LakeMap>\n');
        fprintf(RC,'<PrecipMap>Raincatchment.txt</PrecipMap>\n');
        fprintf(RC,'<PeMap>PETcatchment.txt</PeMap>\n');
        fprintf(RC,'<VegetationDetails><VegetationDetail>Veg Type #, Vegetation Type, Canopy storage capacity (mm), Leaf area index, Maximum rooting depth(m), AE/PE at field capacity,Strickler overland flow coefficient</VegetationDetail>\n');
        fprintf(RC,'<VegetationDetail>1,  EvergreenForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots),string(PEtree),string(strickler));
        fprintf(RC,'<VegetationDetail>2,  DeciduousForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots),string(PEtree),string(strickler));
        fprintf(RC,'<VegetationDetail>4,  ImprovedGrassArable,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA*4),string(root*0.8),string(PEother*5),string(strickler));
        fprintf(RC,'<VegetationDetail>6,  Urban,  0,  0.3,  %s,  0, %s</VegetationDetail>\n',string(root*0.5),string(strickler));
        fprintf(RC,'<VegetationDetail>7,  AcidGrassLand,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
        if tree == 1
            fprintf(RC,'<VegetationDetail>8,  Tree,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(treeroots),string(PEtree),string(strickler));
        else
            fprintf(RC,'<VegetationDetail>8,  Grass,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
        end    
        fprintf(RC,'</VegetationDetails>\n');
        fprintf(RC,'<SoilProperties>\n');
        fprintf(RC,'<SoilProperty>Soil Number,Soil Type, Saturated Water Content, Residual Water Content, Saturated Conductivity (m/day), vanGenuchten- alpha (cm-1), vanGenuchten-n</SoilProperty>\n');
        fprintf(RC,'<SoilProperty>1,SandyClayLoam(65Sand:24Clay), 0.461,   0.167, %s,   1.24E-02,  2</SoilProperty>\n',string(conductivity));
        fprintf(RC,'</SoilProperties>\n');
        fprintf(RC,'<SoilDetails>\n');
        fprintf(RC,'<SoilDetail>Soil Category, Soil Layer, Soil Type, Depth at base of layer (m)</SoilDetail>\n');
        fprintf(RC,'<SoilDetail>1, 1, 1, %s </SoilDetail>\n',string(soild));
        fprintf(RC,'</SoilDetails>\n');
        fprintf(RC,'<InitialConditions>%s</InitialConditions>\n',string(watertable));
        fprintf(RC,'<PrecipitationTimeSeriesData>rainfalltimeseries.csv</PrecipitationTimeSeriesData>\n');
        fprintf(RC,'<PrecipitationTimeStep>24</PrecipitationTimeStep>\n');
        fprintf(RC,'<EvaporationTimeSeriesData>PETtimeseries.csv</EvaporationTimeSeriesData>\n');
        fprintf(RC,'<EvaporationTimeStep>24</EvaporationTimeStep>\n');
        fprintf(RC,'<StartDay>1</StartDay>\n');
        fprintf(RC,'<StartMonth>1</StartMonth>\n');
        fprintf(RC,'<StartYear>2014</StartYear>\n');
        fprintf(RC,'<EndDay>28</EndDay>\n');
        fprintf(RC,'<EndMonth>6</EndMonth>\n');
        fprintf(RC,'<EndYear>2015</EndYear>\n');
        fprintf(RC,'<MinimumDropBetweenChannels>%s</MinimumDropBetweenChannels>\n',string(chandrop));
        fprintf(RC,'<RiverGridSquaresAccumulated>%s</RiverGridSquaresAccumulated>\n',string(grid));
        fprintf(RC,'<DropFromGridToChannelDepth>%s</DropFromGridToChannelDepth>\n',string(griddrop));
        fprintf(RC,'<RegularTimestep>1</RegularTimestep>\n');
        fprintf(RC,'<IncreasingTimestep>0.05</IncreasingTimestep>\n');
        fprintf(RC,'<SimulatedDischargeTimestep>24.0</SimulatedDischargeTimestep>\n');
        fprintf(RC,'</ShetranInput>');


        !"W:\Year 3\Research Project\Shetran Model\Shetran-standard-v4.4.5x64\easy setup\program\start.exe" &

        idealgf=Robot;
        idealgf.keyPress(KeyEvent.VK_J);
        idealgf.keyPress(KeyEvent.VK_M);
        idealgf.keyPress(KeyEvent.VK_A);        
        idealgf.keyPress(KeyEvent.VK_T);
        idealgf.keyPress(KeyEvent.VK_L);
        idealgf.keyPress(KeyEvent.VK_A);
        idealgf.keyPress(KeyEvent.VK_B);
        idealgf.keyPress(KeyEvent.VK_M);
        idealgf.keyPress(KeyEvent.VK_O);
        idealgf.keyPress(KeyEvent.VK_D);
        idealgf.keyPress(KeyEvent.VK_E);
        idealgf.keyPress(KeyEvent.VK_L);
        idealgf.keyPress(KeyEvent.VK_PERIOD);
        idealgf.keyPress(KeyEvent.VK_X);
        idealgf.keyPress(KeyEvent.VK_M);
        idealgf.keyPress(KeyEvent.VK_L);
        idealgf.keyPress(KeyEvent.VK_ENTER);
        pause(30)

        isready = 0;
        while isready == 0
            s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");         
            s1 = s.bytes;
            pause(3)
            s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");
            s2 = s.bytes;
            if s1 == s2
                isready = 1;
            end
        end     
    %          
        system('TASKKILL -f -im "conhost.exe"');
        system('TASKKILL -f -im "start.exe"');           


    %% outputs
            timestep24 = daystep() ;
            %simflow = sum(timestep24);   
            %hrflow24 = table2array((readtable('24hrflow.txt')));
            %lts24 = length(timestep24);
            %hrflow24 = hrflow24(1:lts24);
            %corel =  corrcoef(timestep24,hrflow24);
            %simflowdif = simflow - sum(hrflow24);
            %timestep1 = hourstep();
            %results2 = cat(1,timestep1(:,2),treeroots);
            %resultshourflow = cat(2,resultshourflow,results2);
            %resultshourtime = cat(2,resultshourtime,timestep1(:,1));
            %disp("Flow dif = "+simflowdif)
            %disp("Corelcoff = "+corel(2,1))
            %vale = corel(2,1)*-1;
            timestep24 = cat(1,x(varying),timestep24);
            results = cat(2,results,timestep24);
            disp("-----------------")


        %% Clear temporary variables
            clear opts            




    end
end


function output = daystep()
        opts = delimitedTextImportOptions("NumVariables", 2);

        % Specify range and delimiter
        opts.DataLines = [2, Inf];
        opts.Delimiter = " ";

        % Specify column names and types
        opts.VariableNames = ["discharge", "Var2"];
        opts.SelectedVariableNames = "discharge";
        opts.VariableTypes = ["double", "string"];

        % Specify file level properties
        opts.ExtraColumnsRule = "ignore";
        opts.EmptyLineRule = "read";
        opts.ConsecutiveDelimitersRule = "join";
        opts.LeadingDelimitersRule = "ignore";

        % Specify variable properties
        opts = setvaropts(opts, "Var2", "WhitespaceRule", "preserve");
        opts = setvaropts(opts, "Var2", "EmptyFieldRule", "auto");
        opts = setvaropts(opts, "discharge", "TrimNonNumeric", true);
        opts = setvaropts(opts, "discharge", "ThousandsSeparator", ",");

        % Import the data
        output = table2array(readtable("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_regulartimestep.txt", opts));
end
function outputEastdischargesimeverytimestep = hourstep()
    %% Import data from text file.
    % Script for importing data from the following text file:
    %
    %    W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt
    %
    % To extend the code to different selected data or a different text file, generate a function instead of a script.

    % Auto-generated by MATLAB on 2023/04/06 11:58:51

    %% Initialize variables.
    filename = 'W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt';

    %% Format for each line of text:
    %   column2: double (%f)
    %	column3: double (%f)
    % For more information, see the TEXTSCAN documentation.
    formatSpec = '%*19s%20f%f%[^\n\r]';

    %% Open the text file.
    fileID = fopen(filename,'r');

    %% Read columns of data according to the format.
    % This call is based on the structure of the file used to generate this code. If an error occurs for a different file, try regenerating the code from the Import Tool.
    dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);

    %% Close the text file.
    fclose(fileID);

    %% Post processing for unimportable data.
    % No unimportable data rules were applied during the import, so no post processing code is included. To generate code which works for unimportable data, select unimportable cells in a file and regenerate the script.

    %% Create output variable
    outputEastdischargesimeverytimestep = [dataArray{1:end-1}];
    %% Clear temporary variables
    clearvars filename formatSpec fileID dataArray ans;
end
