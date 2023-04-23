%%Create Rain and PET catchment files

y = 28000;
row = 36;
col = 50;
line = string(y);
str = "";
for i= 1:row
    str = append(str,line," ");
end


RC = fopen('Raincatchment.txt','w');
PC = fopen('PETcatchment.txt','w');

s1 = 'ncols   '+string(col);
s2 = 'rows   '+string(row);
s3 = 'xllcorner    259546.111211111129';
s4 = 'yllcorner    77494.200100000002';
s5 = 'cellsize 173';
s6 = 'NODATA_value  -9999';

fprintf(RC,'%s\n %s\n %s\n %s\n %s\n %s\n',s1,s2,s3,s4,s5,s6);
fprintf(PC,'%s\n %s\n %s\n %s\n %s\n %s\n',s1,s2,s3,s4,s5,s6);

for i = 1:col
    fprintf(RC,'%s\n',str);
    fprintf(PC,'%s\n',str);
end