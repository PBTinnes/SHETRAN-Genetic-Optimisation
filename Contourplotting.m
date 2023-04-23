%%Contour Plots
close all
phrebase = xlsread('Wetlevel.xlsx','af1')
%phreaf1 = xlsread('Wetlevel.xlsx','af5')

for i = 1:4
test = phrebase(1+(52*(i-1)):52+(52*(i-1)),1:38)
%test2 = phreaf1(1+(52*(i-1)):52+(52*(i-1)),1:38)
%ZI = griddata(E,N,H,XI,YI,'V4');
figure()
set(gcf, 'Position',  [100, 100, 800, 800])
%contourf(flip(test))
s = sprintf("T%s",string(i))
a = 0:0.1:52
b = 0:0.1:38

test = interp2(test,'linear')
%test2 = interp2(test2,'linear')

contourf(flip(test),linspace(-0.1,2.6,12),'LineWidth',0.01);
set(gca,'FontName','Times New Roman','FontSize',12)
axis equal
axis tight
grid on
xticks(0:8:76)
xticklabels({0:4:38})
yticks(0:8:104)
yticklabels({0:4:52})
xlabel("Grids in X")
ylabel("Grids in Y")
c= colorbar('height','location','eastoutside','FontSize',12);
c.Label.String = 'Phreatic Surface Depth (m)';
text(5.5,4,s,'fontSize', 18, 'Color', 'k', 'VerticalAlignment','bottom','FontName','Times New Roman')
end