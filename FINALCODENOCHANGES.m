%genetic algorithm

import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
results = [];
Timer = 0;

count = 0;



fclose('all');
%water,leafS,leafA,root,strickler,soildepth
%x=[2.974861309	0.017830113	0.854819069	1.373519817	1.098894971	16.063601652	1.658030306	25.74012542	28.2960516	16.07278004	1.572660548	0.164051502];
%x=[1.485658906	0.32522347	0.861970504	0.790462589	1.825816977	0.6	2.669068276	29.1226908	32.34078421	13.78609383	1.857321453	0.159549629];
x = [1.960141747    2.482515887	31.81288238	34.87245107	18.34376574	1.517978457	0.185127873];
%x(1)= 2;    %strickler = string(2);
%x(2) = 0;    %watertable = 0;
%x(3) = 0.75;    %leafS = 0.75;
%x(4) = 0.75;    %leafA = 0.75;
%x(5) = 1;    %root = 1;
%x(6) = 2.1;    %conductivity = 3;
%x(7) = 1.5;    %soild = 1.6;
%x(8) = 25;    %grid = 25;
%x(9) = 18;    %griddrop = 18;
%x(10) = 15;    %chandrop = 15;
%x(11) = 1;    %PEtree = base is 1
%x(12) =0.1;   %PEother = base is 0.1

options = optimoptions('ga','PopulationSize',15,'MaxGenerations',8,'PlotFcn', @gaplotbestf);
gate1 = x;
%fun = @geneticy;
%[gate1,geninp,exitflag,gendat] = ga(fun,7,[],[],[],[],[1,1,8,8,8,0.5,0.05],[6,3,40,40,20,2,0.2],[],options);





import java.awt.Robot;
import java.awt.event.*;
disp("x= "+x)
tic

count = 1;
%set variables



%watertable,leafS*5,leafA*6,root*2,strickler conductivity soild
%ga variables ---------------------------------------
for i = [0.1,0.5,0.55,0.6,0.65,0.7,1]
strickler = string(x(1));
watertable = 0.33;
leafS = 0.879;
leafA = 0.86;
root = 1.8;
conductivity = 0.6;
soild = x(2);
grid = x(3);
griddrop = x(4);
chandrop = x(5);
PEtree = x(6);
PEother = x(7);





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
fprintf(RC,'<VegetationDetail>1,  EvergreenForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(root*2),string(PEtree),string(strickler));
fprintf(RC,'<VegetationDetail>2,  DeciduousForest,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(root*1.5),string(PEtree),string(strickler));
fprintf(RC,'<VegetationDetail>4,  ImprovedGrassArable,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA*4),string(root*0.8),string(PEother*5),string(strickler));
fprintf(RC,'<VegetationDetail>6,  Urban,  0,  0.3,  %s,  0, %s</VegetationDetail>\n',string(root*0.5),string(strickler));
fprintf(RC,'<VegetationDetail>7,  AcidGrassLand,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
fprintf(RC,'<VegetationDetail>8,  Bog,  %s,  %s,  %s,  %s, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(PEother),string(strickler));
fprintf(RC,'</VegetationDetails>\n');
fprintf(RC,'<SoilProperties>\n');
fprintf(RC,'<SoilProperty>Soil Number,Soil Type, Saturated Water Content, Residual Water Content, Saturated Conductivity (m/day), vanGenuchten- alpha (cm-1), vanGenuchten-n</SoilProperty>\n');
fprintf(RC,'<SoilProperty>1,SandyClayLoam(65Sand:24Clay), 0.461,   0.167, %s,   1.24E-02,  2</SoilProperty>\n',string(conductivity));
fprintf(RC,'<SoilProperty>2,Bedrock, 0.461,   0.167, %s,   1.24E-02,  6</SoilProperty>\n',string(0.00001));
fprintf(RC,'</SoilProperties>\n');
fprintf(RC,'<SoilDetails>\n');
fprintf(RC,'<SoilDetail>Soil Category, Soil Layer, Soil Type, Depth at base of layer (m)</SoilDetail>\n');
fprintf(RC,'<SoilDetail>1, 1, 1, %s </SoilDetail>\n',string(soild));
fprintf(RC,'<SoilDetail>1, 2, 2, %s </SoilDetail>\n',string(soild+2));
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
fprintf(RC,'<SimulatedDischargeTimestep>1.0</SimulatedDischargeTimestep>\n');
fprintf(RC,'</ShetranInput>');


!"W:\Year 3\Research Project\Shetran Model\Shetran-standard-v4.4.5x64\easy setup\program\start.exe" &
pause(0.3)
import java.awt.event.KeyEvent;
idealgf=Robot;
idealgf.keyPress(KeyEvent.VK_J);
pause(0.1)
idealgf.keyPress(KeyEvent.VK_DOWN);
pause(0.1)
idealgf.keyPress(KeyEvent.VK_ENTER);
pause(15)

isready = 0;
while isready == 0
    s = dir("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_everytimestep.txt");         
    s1 = s.bytes;
    pause(1)
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
    %hrflow24 = table2array((readtable('24hrflow.txt')));
    %lts24 = length(timestep24);
    %hrflow24 = hrflow24(1:lts24);
    %corel =  corrcoef(timestep24,hrflow24);
    %vale = vale - sum(hrflow24);
    %timestep24 = cat(1,timestep24,root,PEtree,PEother,corel(2,1),vale);
    results = cat(2,results,timestep24);
    %disp("Flow dif = "+vale)
    %disp("Corelcoff = "+corel(2,1))
    %vale = corel(2,1)*-1;
    disp("-----------------")


%% Clear temporary variables
    clear opts            
    Tims = toc;
    disp(Tims)
    disp("Iteration: "+count)



end
end

