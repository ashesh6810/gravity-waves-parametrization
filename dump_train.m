clear all;close all;clc;
input=hdf5read('NOGWD_REDUCED_Y1.h5','x');
output=hdf5read('NOGWD_REDUCED_Y1.h5','y');
load('look_up_y1.mat');

disp(size(input))
disp(size(output))
disp(size(look_up))


u=input(1:63,:);
v=input(64:126,:);
T=input(127:189,:);
P=input(190,:);
duout=output(1:62,:);
dvout=output(63:124,:);

[indu1,indu2]=find(u>60);
[indv1,indv2]=find(v>60);

rm_col=union(indu2,indv2);
%for i=1:length(indu2)
%   u(:,indu2(i))=[];
%end

%for j=1:length(indv2)
%   v(:,indv2(j))=[];
%end

%% getting rid of outliers

u(:,rm_col)=[];
v(:,rm_col)=[];
T(:,rm_col)=[];
P(:,rm_col)=[];
look_up(rm_col,:)=[];
duout(:,rm_col)=[];
dvout(:,rm_col)=[];
u=u(:,1:208486);
v=v(:,1:208486);
T=T(:,1:208486);
P=P(:,1:208486);
duout=duout(:,1:208486);
dvout=dvout(:,1:208486);
look_up=look_up(1:208486,:);

disp(size(u))
disp(size(v))
disp(size(T))
disp(size(P))
disp(size(look_up))

disp('max u')
disp(max(max(u)))


disp('max v')
disp(max((max(v))))

%% normalization
mu=mean(u(:));
stdu=std(u(:));
u=(u-mu)./stdu;

mv=mean(v(:));
stdv=std(v(:));
v=(v-mv)./stdv;

mT=mean(T(:));
stdT=std(T(:));
T=(T-mT)./stdT;

mP=mean(P(:));
stdP=std(P(:));
P=(P-mP)./stdP;

meandu=mean(duout(:));
stddu=std(duout(:));
duout=(duout-meandu)./stddu;

meandv=mean(dvout(:));
stddv=std(dvout(:));
dvout=(dvout-meandv)./stddv;

data_input=cat(1,u,v,T,P);
data_output=cat(1,duout,dvout);

save('DATA_FILE_FULL_Y1.mat','data_input','data_output','look_up','-v7.3');


