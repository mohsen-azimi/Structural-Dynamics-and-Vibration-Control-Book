%**********************************************************
% to draw elastic design spectra from the earthquake data
% read the response spectrum values in this program
%**********************************************************
for k=.00001:.00001:.0001
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);
loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
hold on
end

for k=.0001:.0001:.001
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);
loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
hold on
end

for k=.001:.001:.01
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);
loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
hold on
end
xlabel(' period in secs')
ylabel(' spectral velocity sv in cm/sec')
for k=.01:.01:.1
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);
loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
hold on
end
for k=.1:.1:1
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);
loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
hold on
end
for k=1:1:10
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);

loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
hold on
end
for k=10:10:100
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);
loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
hold on
end
for k=100:100:1000
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);
loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
hold on
end
for k=1000:1000:10000
beta=0.1:1:10;
t=log(2*pi*k)-log(beta);
y=exp(t);
loglog(beta,y,'k'),grid on
hold on
t=log(k*9.81/(2*pi))+log(beta);
y=exp(t);
loglog(beta,y,'k')
end
axis([0.1 10 0 600])

%%
% d=xlsread('svdata');



d=load('sv.out');
plot(d(:,1),100*d(:,2),'k')
plot(d(:,1),100*d(:,3),'k')
plot(d(:,1),100*d(:,4),'k')
plot(d(:,1),100*d(:,5),'k')
plot(d(:,1),100*d(:,6),'k')
text(0.2,0.02,'0.001');
text(0.6,0.1,'0.01');
text(2,0.3,'0.1');
text(7,1,'1');
text(20,3,'10');
text(80,10,'100')
text(20,1,'sd in cm')
xlabel(' period in sec')
ylabel(' sv in cm/sec')
text(0.01,200,'100')
text(0.01,20,'10')
text(0.01,2,'1')
text(0.02,0.4,'0.1')
text(0.07,0.1,'0.01')
text(.02,0.8,'sa/g')
gtext(' no damping')
gtext(' damping=2%')
gtext(' damping=5%')
gtext(' damping=10%')
gtext(' damping=20%')