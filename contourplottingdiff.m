%%Contour Plots
close all
%phrebase = xlsread('Wetlevel.xlsx','af0.5');
phrebase = xlsread('Wetlevel.xlsx','Base 1.7');
phreaf1 = xlsread('Wetlevel.xlsx','af0.5');
phreaf2 = xlsread('Wetlevel.xlsx','af1');
phreaf3 = xlsread('Wetlevel.xlsx','af2.5');

phrebase(phrebase==-1)=500;
for i = 1:4

    test = phrebase(1+(52*(i-1)):52+(52*(i-1)),1:38);
    test2 = phreaf1(1+(52*(i-1)):52+(52*(i-1)),1:38);
    %ZI = griddata(E,N,H,XI,YI,'V4');
    s = sprintf("D = 1 +T = %s",string(i));
    figure('Name',s)
    set(gcf, 'Position',  [100, 100, 800, 800]);
    %contourf(flip(test))

    a = 0:0.1:52;
    b = 0:0.1:38;
    test = interp2(test,'linear');
    test2 = interp2(test2,'linear');

    contourf(flip(test2-test),linspace(-0.2,max(test2-test,[],"all"),10),'LineWidth',0.01);
    set(gca,'FontName','Times New Roman','FontSize',12);
    axis equal;
    axis tight;
    grid on;
    xticks(0:8:76);
    xticklabels({0:4:38});
    yticks(0:8:104);
    yticklabels({0:4:52});
    xlabel("Grids in X");
    ylabel("Grids in Y");
    c= colorbar('height','location','eastoutside','FontSize',12);
    c.Label.String = 'ΔPhreatic Surface Depth (m)';
    test3 = test2-test;
    textlabel = sprintf('Maximum Δ = %0.2fm',max(test3,[],"all"));
    textlabel2 = sprintf('T%s: Afforested root depth = 0.5m',string(i));
    text(42,97,textlabel, 'fontSize', 15, 'Color', 'k', 'VerticalAlignment','bottom','FontName','Times New Roman')
    text(42,94,textlabel2, 'fontSize', 11, 'Color', 'k', 'VerticalAlignment','bottom','FontName','Times New Roman')

    %%
    test = phrebase(1+(52*(i-1)):52+(52*(i-1)),1:38);
    test2 = phreaf2(1+(52*(i-1)):52+(52*(i-1)),1:38);
    %ZI = griddata(E,N,H,XI,YI,'V4');
    s = sprintf("D = 2.5 +T = %s",string(i));
    figure('Name',s)
    set(gcf, 'Position',  [100, 100, 800, 800]);
    %contourf(flip(test))

    a = 0:0.1:52;
    b = 0:0.1:38;
    test = interp2(test,'linear');
    test2 = interp2(test2,'linear');

    contourf(flip(test2-test),linspace(-0.2,max(test2-test,[],"all"),10),'LineWidth',0.01);
    set(gca,'FontName','Times New Roman','FontSize',12);
    axis equal;
    axis tight;
    grid on;
    xticks(0:8:76);
    xticklabels({0:4:38});
    yticks(0:8:104);
    yticklabels({0:4:52});
    xlabel("Grids in X");
    ylabel("Grids in Y");
    c= colorbar('height','location','eastoutside','FontSize',12);
    c.Label.String = 'ΔPhreatic Surface Depth (m)';
    test3 = test2-test;
    textlabel = sprintf('Maximum Δ = %0.2fm',max(test3,[],"all"));
    textlabel2 = sprintf('T%s: Afforested root depth = 1m',string(i));
    text(42,97,textlabel, 'fontSize', 15, 'Color', 'k', 'VerticalAlignment','bottom','FontName','Times New Roman')
    text(42,94,textlabel2, 'fontSize', 11, 'Color', 'k', 'VerticalAlignment','bottom','FontName','Times New Roman')
    %%
    test = phrebase(1+(52*(i-1)):52+(52*(i-1)),1:38);
    test2 = phreaf3(1+(52*(i-1)):52+(52*(i-1)),1:38);
    %ZI = griddata(E,N,H,XI,YI,'V4');
    s = sprintf("D = 5m +T = %s",string(i));
    figure('Name',s)
    set(gcf, 'Position',  [100, 100, 800, 800]);
    %contourf(flip(test))

    a = 0:0.1:52;
    b = 0:0.1:38;
    test = interp2(test,'linear');
    test2 = interp2(test2,'linear');

    contourf(flip(test2-test),linspace(-0.2,max(test2-test,[],"all"),10),'LineWidth',0.01);
    set(gca,'FontName','Times New Roman','FontSize',12);
    axis equal;
    axis tight;
    grid on;
    xticks(0:8:76);
    xticklabels({0:4:38});
    yticks(0:8:104);
    yticklabels({0:4:52});
    xlabel("Grids in X");
    ylabel("Grids in Y");
    c= colorbar('height','location','eastoutside','FontSize',12);
    c.Label.String = 'ΔPhreatic Surface Depth (m)';    test3 = test2-test;
    textlabel = sprintf('Maximum Δ = %0.2fm',max(test3,[],"all"));
    textlabel2 = sprintf('T%s: Afforested root depth = 2.5m',string(i));
    text(42,97,textlabel, 'fontSize', 15, 'Color', 'k', 'VerticalAlignment','bottom','FontName','Times New Roman')
    text(42,94,textlabel2, 'fontSize', 11, 'Color', 'k', 'VerticalAlignment','bottom','FontName','Times New Roman')
end