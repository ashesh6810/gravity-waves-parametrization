clear all;close all;clc

load('DATA_FILE_Y2.mat','look_up');

load('prediction_Y2.mat');

disp(size(ypred))
disp(size(truth))
disp(size(look_up))

time_index=12240 %% August some time

[ind1,ind2]=find(look_up(:,3)==time_index);

latlon=look_up(ind1,1:2);

predicted=ypred(ind1,:);
target=truth(ind1,:);

save('post_process_y2.mat','predicted','target','latlon','-v7.3');




