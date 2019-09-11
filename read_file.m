clear all;close all;clc;
input=hdf5read('NOGWD_REDUCED_Y2.h5','x');
output=hdf5read('NOGWD_REDUCED_Y2.h5','y');

disp(size(input))
disp(size(output))

csvwrite('input.csv',input);
csvwrite('output.csv',output);

u=input(1:63,:);
v=input(64:126,:);

disp('Max u')
disp(max(max(u)))

disp('Max v')
disp(max(max(v)))


[ind1,ind2]=find(u==max(max(u)));
[ind3,ind4]=find(v==max(max(v)));

h=figure(6)
plot(u(:,ind2));
savefig(h,'umax.fig')
close(h)

h=figure(7)
plot(v(:,ind4));
savefig(h,'vmax.fig')
close(h)




count=1;
h=figure(1)

 for i=10000:10000+4

  subplot(2,2,count)

  plot(input(1:63,i),'k')
  count=count+1;
end

savefig(h,'u.fig')
close(h)

count=1;
h=figure(2)

 for i=10000:10000+4

  subplot(2,2,count)

  plot(input(64:126,i),'k')
  count=count+1;
end

savefig(h,'v.fig')
close(h)

count=1;
h=figure(3)

 for i=10000:10000+4

  subplot(2,2,count)

  plot(input(127:189,i),'k')
  count=count+1;
end

savefig(h,'T.fig')
close(h)

count=1;
h=figure(4)

 for i=10000:10000+4

  subplot(2,2,count)

  plot(output(1:62,i),'k')
  count=count+1;
end

savefig(h,'du.fig')
close(h)

count=1;
h=figure(5)

 for i=10000:10000+4
    
  subplot(2,2,count)
    
  plot(output(63:124,i),'k')
  count=count+1;
end 

savefig(h,'dv.fig')
close(h)
