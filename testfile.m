clear all
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

    timestep24 = table2array(readtable("W:\Year 3\Research Project\EastDartStandard\Sensitvity analysis\output_East_discharge_sim_regulartimestep.txt", opts));
    vale = sum(timestep24);
    vale = vale - 315.69;
    hrflow24 = table2array((readtable('24hrflow.txt')));
    lts24 = length(timestep24);
    hrflow24 = hrflow24(1:lts24)
    corel =  corrcoef(timestep24,hrflow24)
    disp(vale+" m3/s")
end