%genetic algorithm

import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
results = [];
Timer = 0;
count = 0;



fclose('all');
%water,leafS,leafA,root,strickler,soildepth
x=[2.974861309,	0.017830113,	0.854819069,	1.373519817,	1.098894971,	3,	1.658030306,	25.74012542,	28.2960516,	16.07278004,	1.572660548,	0.164051502];
%x(1) = 0; %water table
%x(2) = 1; %canopy storage mm;
%x(3) = 1; %canopy leaf area index;
%x(4) = 1; %rootdepth;
%x(5) = 1.2; %conductivity
%x(5) = 1.2; %soil depth
%x(6) = 20;%grid sections for channel;
%x(7) = 1; %griddrop;
%x(8) = 2;%chan drop;

%options = optimoptions('ga','PopulationSize',25,'MaxGenerations',15,'PlotFcn', @gaplotbestf);

%fun = @geneticy;
%[gate1,geninp,exitflag,gendat] = ga(fun,8,[],[],[],[],[0,0.8,0.8,0.5,1,10,0.5,0.5],[1,1.5,1.2,4,4,30,2,2],[],options);

best = bestboy(x);


function vale = geneticy(x)

    import java.awt.Robot;
    import java.awt.event.*;
    disp("x= "+x)

    %set variables
    strickler = string(1);
    %conductivity = string(2.022112431);
    %soild = string(1.253300923);
    
    
    %watertable,leafS*5,leafA*6,root*2,strickler conductivity soild
    %ga variables ---------------------------------------
    
    watertable = x(1);
    leafS = x(2);
    leafA = x(3);
    root = x(4);
    conductivity = 1.6;
    soild = x(5);
    grid = x(6);
    griddrop = x(7);
    chandrop = x(8);
    
    
    
    

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
    fprintf(RC,'<VegetationDetail>1,  EvergreenForest,  %s,  %s,  %s,  1, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(root*2),string(strickler));
    fprintf(RC,'<VegetationDetail>2,  DeciduousForest,  %s,  %s,  %s,  1, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(root*1.5),string(strickler));
    fprintf(RC,'<VegetationDetail>4,  ImprovedGrassArable,  %s,  %s,  %s,  0.5, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA*4),string(root*0.8),string(strickler));
    fprintf(RC,'<VegetationDetail>6,  Urban,  0,  0.3,  %s,  0, %s</VegetationDetail>\n',string(root*0.5),string(strickler));
    fprintf(RC,'<VegetationDetail>7,  AcidGrassLand,  %s,  %s,  %s,  0.1, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(strickler));
    fprintf(RC,'<VegetationDetail>8,  Bog,  %s,  %s,  %s,  0.1, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(strickler));
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
    fprintf(RC,'<EndYear>2014</EndYear>\n');
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


        %% Clear temporary variables
        timestep24 = table2array(readtable("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_regulartimestep.txt", opts));
        vale = sum(timestep24);

        hrflow24 = table2array((readtable('24hrflow.txt')));
        lts24 = length(timestep24);
        hrflow24 = hrflow24(1:lts24);
        vale = vale - sum(hrflow24);
        corel =  corrcoef(timestep24,hrflow24);
        disp(vale+" m3/s")
        vale = -corel(2,1);
        disp(vale)

    end
end

function valebest = bestboy(x) 
    import java.awt.Robot;
    import java.awt.event.*;
    disp("x= "+x)

    %set variables
    strickler = string(1);
    %conductivity = string(2.022112431);
    %soild = string(1.253300923);
    
    
    %watertable,leafS*5,leafA*6,root*2,strickler conductivity soild
    %ga variables ---------------------------------------
    
    watertable = x(1);
    leafS = x(2);
    leafA = x(3);
    root = x(4);
    conductivity = 1.6;
    soild = x(5);
    grid = x(6);
    griddrop = x(7);
    chandrop = x(8);
    
    
    
    

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
    fprintf(RC,'<VegetationDetail>1,  EvergreenForest,  %s,  %s,  %s,  1, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(root*2),string(strickler));
    fprintf(RC,'<VegetationDetail>2,  DeciduousForest,  %s,  %s,  %s,  1, %s</VegetationDetail>\n',string(leafS*5),string(leafA*6),string(root*1.5),string(strickler));
    fprintf(RC,'<VegetationDetail>4,  Grass,  %s,  %s,  %s,  0.5, %s</VegetationDetail>\n',string(leafS),string(leafA),string(root),string(strickler));
    fprintf(RC,'<VegetationDetail>6,  Urban,  0,  0,  0,  0, %s</VegetationDetail>\n',string(strickler));
    fprintf(RC,'<VegetationDetail>7,  Grass,  %s,  %s,  %s,  0.1, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(strickler));
    fprintf(RC,'<VegetationDetail>8,  Grass,  %s,  %s,  %s,  0.1, %s</VegetationDetail>\n',string(leafS*1.5),string(leafA),string(root),string(strickler));
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
    fprintf(RC,'<EndMonth>4</EndMonth>\n');
    fprintf(RC,'<EndYear>2014</EndYear>\n');
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


        %% Clear temporary variables
        timestep24 = table2array(readtable("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_regulartimestep.txt", opts));
        vale = sum(timestep24);
        vale = vale - 315.69;
        hrflow24 = table2array((readtable('24hrflow.txt')));
        lts24 = length(timestep24);
        hrflow24 = hrflow24(1:lts24);
        corel =  corrcoef(timestep24,hrflow24);
        disp(vale+" m3/s")
        valebest = -corel(2,1);

    end
end