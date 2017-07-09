% read csv file
filename = 'localization_infos.csv';
csvMat = csvread(filename);
% convert csvMat into different variables, vectors and matrices to work with
realPos_x = csvMat(:,1);
realPos_y = csvMat(:,2);
realPos_psi = csvMat(:,3);
curPos_x = csvMat(:,4);
curPos_y = csvMat(:,5);
curPos_psi = csvMat(:,6);
odomPos_x = csvMat(:,7);
odomPos_y = csvMat(:,8);
odomPos_psi = csvMat(:,9);
n = length(realPos_x);
t = (0:n-1) * 0.1;

lw = 3;
fs = 30;

plotError = false;
plotRoundabout = true;

if (plotError)
    % plot distance error
    figure;
    plot(t,sqrt((realPos_x-curPos_x).^2 + (realPos_y-curPos_y).^2),'LineWidth',lw,'Color','blue');
    hold on;
    plot(t,sqrt((realPos_x-odomPos_x).^2 + (realPos_y-odomPos_y).^2),'LineWidth',lw,'Color','black');
    set(gca,'FontSize',fs);
    xlabel('Time [s]');
    ylabel('Absolute Error [m]');
    legend('Localization error','Odometry error');
    % plot orientation error
    figure;
    plot(t,getPsiDifference(realPos_psi,curPos_psi),'LineWidth',lw,'Color','blue');
    hold on;
    plot(t,getPsiDifference(realPos_psi,odomPos_psi),'LineWidth',lw,'Color','black');
    set(gca,'FontSize',fs);
    xlabel('Time [s]');
    ylabel('Absolute Error [rad]');
    legend('Localization error','Odometry error');
end

if (plotRoundabout)
    % plot roundabout traffic and create gif
    % read landmark csv file
    filenameLm = 'localization_lm.csv';
    csvMatLm = csvread(filenameLm);
    MatImage = imread('roundabout.png');
    scaling = 11;
    offsetX = 275; offsetY = 450;

    n_iter = (size(csvMatLm,1)-2)/2;
    Xglob = csvMatLm(1,:);
    Yglob = csvMatLm(2,:);
    [Xglob,Yglob] = removeEmptyElements(Xglob,Yglob);
    f = figure;
    image(MatImage);
    set(gca,'FontSize',10);
    hold on;
    plot(Xglob*scaling+offsetX,-Yglob*scaling+offsetY,'o','LineWidth',lw,'MarkerEdgeColor','green');
    hold on;
    plot(realPos_x*scaling+offsetX,-realPos_y*scaling+offsetY,'LineWidth',lw,'Color','magenta');
    hold on;
    for i=1:(min(100,n_iter)) 
        Xloc = csvMatLm(3+(i-1)*2,:);
        Yloc = csvMatLm(4+(i-1)*2,:);
        [Xloc,Yloc] = removeEmptyElements(Xloc,Yloc);
        set(f, 'Units', 'normalized', 'Position', [0.2, 0.1, 0.7, 0.7]); 
        Loclms = plot(Xloc*scaling+offsetX,-Yloc*scaling+offsetY,'o','LineWidth',lw,'MarkerEdgeColor','red');
        hold on;
        realPoses = plot(realPos_x(i)*scaling+offsetX,-realPos_y(i)*scaling+offsetY,'+','LineWidth',lw,'MarkerEdgeColor','magenta');
        hold on;
        curPoses = plot(curPos_x(i)*scaling+offsetX,-curPos_y(i)*scaling+offsetY,'+','LineWidth',lw,'MarkerEdgeColor','blue');
        hold on;
        odomPoses = plot(odomPos_x(i)*scaling+offsetX,-odomPos_y(i)*scaling+offsetY,'+','LineWidth',lw,'MarkerEdgeColor','cyan');
        xlabel('x');
        ylabel('y');
        legend('Global landmarks','Real trajectory','Sensed landmarks','Real pos.','Localized pos.','Odometry pos.');
        % gif utilities
        drawnow;
        frame = getframe(1);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        outfile = ['roundabout.gif'];
        % on first loop, create the file
        if i == 1
            imwrite(imind,cm,outfile,'gif','DelayTime',0,'loopcount',inf);
        else
            imwrite(imind,cm,outfile,'gif','DelayTime',0,'writemode','append');
        end
        % pause and clear plot
        pause(0.000001);
        delete(Loclms); delete(realPoses); delete(curPoses); delete(odomPoses);
        %clf;
    end
end