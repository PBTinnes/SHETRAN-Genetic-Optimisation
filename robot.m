

%{
import java.awt.Robot;
import java.awt.event.*;

!"W:\Year 3\Research Project\Shetran Model\Shetran-standard-v4.4.5x64\easy setup\program\start.exe" &

import java.awt.event.KeyEvent;
idealgf=Robot;
idealgf.keyPress(KeyEvent.VK_E);
pause(0.1)
idealgf.keyPress(KeyEvent.VK_DOWN);
pause(0.1)
idealgf.keyPress(KeyEvent.VK_ENTER);
system('TASKKILL -f -im "conhost.exe"');
system('TASKKILL -f -im "start.exe"');
%}
file = fopen("output_East_discharge_sim_regulartimestep.txt",'r');
c=textscan(file,'%s','delimiter','\n','Whitespace',' ')
d=fscanf(file,'%10f')
