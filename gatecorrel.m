%genetic algorithm
clear all
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
results = [];
Timer = 0;
count = 0;



fclose('all')

x=[];
x(1) = 1.5; %Strickler
x(2) = 1.8; %Conductivity;
x(3) = 0.5; %Soil Depth;


options = optimoptions('ga','PopulationSize',20,'MaxGenerations',10);

fun = @geneticy;
%[gate1,geninp,exitflag,gendat] = ga(fun,3,[],[],[],[],[1,1.5,1],[2,2.1,1.2],[],options);



function vale = geneticy(x)

    import java.awt.Robot;
    import java.awt.event.*;
    disp("x= "+x)

    strickler = string(x(1));
    conductivity = string(x(2));
    soild = string(x(3));
    RC = fopen('Jmatlabmodel.xml','w');
    watertable = string(0);
    fprintf(RC,'<?xml version="1.0"?><ShetranInput>\n');
    fprintf(RC,'<ProjectFile>Amatlabmodel.xml</ProjectFile>\n');
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
    fprintf(RC,'<VegetationDetail>1,  EvergreenForest,  5.0,  6,  2,  1, %s</VegetationDetail>\n',strickler);
    fprintf(RC,'<VegetationDetail>2,  DeciduousForest,  5.0,  6,  1.5,  1, %s</VegetationDetail>\n',strickler);
    fprintf(RC,'<VegetationDetail>4,  Grass,  1.5,  6,  1,  0.5, %s</VegetationDetail>\n',strickler);
    fprintf(RC,'<VegetationDetail>6,  Urban,  0,  0.3,  0.5,  0.4, %s</VegetationDetail>\n',strickler);
    fprintf(RC,'<VegetationDetail>7,  Grass,  1.5,  6,  1,  0.1, %s</VegetationDetail>\n',strickler);
    fprintf(RC,'<VegetationDetail>8,  Grass,  1.5,  6,  1,  0.1, %s</VegetationDetail>\n',strickler);
    fprintf(RC,'</VegetationDetails>\n');
    fprintf(RC,'<SoilProperties>\n');
    fprintf(RC,'<SoilProperty>Soil Number,Soil Type, Saturated Water Content, Residual Water Content, Saturated Conductivity (m/day), vanGenuchten- alpha (cm-1), vanGenuchten-n</SoilProperty>\n');
    fprintf(RC,'<SoilProperty>1,SandyClayLoam(65Sand:24Clay), 0.461,   0.167, %s,   1.24E-02,  2</SoilProperty>\n',conductivity);
    fprintf(RC,'</SoilProperties>\n');
    fprintf(RC,'<SoilDetails>\n');
    fprintf(RC,'<SoilDetail>Soil Category, Soil Layer, Soil Type, Depth at base of layer (m)</SoilDetail>\n');
    fprintf(RC,'<SoilDetail>1, 1, 1, %s </SoilDetail>\n',soild);
    fprintf(RC,'</SoilDetails>\n');
    fprintf(RC,'<InitialConditions>%s</InitialConditions>\n',watertable);
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
    fprintf(RC,'<MinimumDropBetweenChannels>0.5</MinimumDropBetweenChannels>\n');
    fprintf(RC,'<RiverGridSquaresAccumulated>20</RiverGridSquaresAccumulated>\n');
    fprintf(RC,'<DropFromGridToChannelDepth>2</DropFromGridToChannelDepth>\n');
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



    end
        timestep24 = table2array(readtable("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_regulartimestep.txt", opts));
        vale = sum(timestep24);
        vale = vale - 315.69;
        hrflow24 = table2array((readtable('24hrflow.txt')));
        corel =  corrcoef(timestep24,hrflow24(:,length(timestep24)))
        disp(vale+" m3/s")
end

