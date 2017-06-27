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

% plot error
figure;
plot(t,sqrt((realPos_x-curPos_x).^2 + (realPos_y-curPos_y).^2),'LineWidth',2,'Color','blue');
hold on;
plot(t,sqrt((realPos_x-odomPos_x).^2 + (realPos_y-odomPos_y).^2),'LineWidth',2,'Color','green');
xlabel('Time [0.1s]');
ylabel('Absolute Error [m]');
legend('Localization error','Odometry error');
   