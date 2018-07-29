%Moeti Ncube: This program is used to compare 3 particle methods (particle
%filter, forward backward smoother (FBS),and Maximum A-Posterior Smoother 
%(MAP). It computes the likelihood and MSE
%of each method compared with the dynamical system given.
% See Chapter 5 of thesis.pdf for detailed description of methods, models,
% and results generated by this code.

T=100; %Number of Time Steps
n=10; %Number of Particles
m=1; %Number of iterations

for iter=1:m 
%Mean and standard deviation of state equation
a=.6; b=.2;
%Mean and standard deviation of state equation
c=2; d=.2;

%Simulate the dynamical system x and y, initializing x(1)=x0
x0=rand;
[x,y]=simulate(a,b,c,d,x0,T);

%Particle Filter, particles initialized at xf(:,1)=X0
X0=random('uniform',0,1,n,1);
tic
[xf,wftilda]=pfilter(a,b,c,d,X0,y);
toc

%Particle Smoothing (FBS)
tic
[wstilda wstilda2,wstilda3]=fbssmoother(a,b,xf,wftilda);
toc

%Particle Smoother (Maximum A-posterior) initialized at xf(:,1)=X20
%Initialization
X20=zeros(n,1);
tic
[psi,delta,meanm,wstilda4,wstilda5]=mapsmoother(a,b,c,d,X20,xf,wftilda,y);
toc

%Estimation of filter and fbs smoother posterior means at time t
for t=2:T
meanf(t)=xf(:,t)'*wftilda(:,t);
means(t)=xf(:,t)'*wstilda(:,t);
meansf(t)=xf(:,t)'*wstilda(:,t);
end

%Computes the MSE of filter, fbs, and map
FilterMSE(iter)=norm(x(2:end)-meanf(2:end),'fro')/norm(x(2:end),'fro')
FBSsmootherMSE(iter)=norm(x(2:end)-means(2:end),'fro')/norm(x(2:end),'fro')
MAPsmootherMSE(iter)=norm(x(2:end)-meanm(2:end),'fro')/norm(x(2:end),'fro')
%Computes the Likelihood of filter, fbs, and map
LL(iter)=likelihood(y,x,a,b,c,d)
FilterLL(iter)=likelihood(y,meanf,a,b,c,d)
FBSsmootherLL(iter)=likelihood(y,means,a,b,c,d)
MAPsmootherLL(iter)=likelihood(y,meanm,a,b,c,d)
end

if m==1
%Plots of simulated x vs the estimated xhat of filter, fbs, and map
hold on
plot(x(2:end),'k','linewidth',2)
plot(meanf(2:end),':r*','linewidth',2)
plot(means(2:end),':go','linewidth',2)
plot(meanm(2:end),':bd','linewidth',2)
xlabel('time')
ylabel('state')
h = legend('True State','Filter','FBS-Smoother','MAP-Smoother');
else
fmean=mean(FilterMSE)  
smean=mean(FBSsmootherMSE) 
mmean=mean(MAPsmootherMSE)
fll=mean(FilterLL)  
sll=mean(FBSsmootherLL) 
mll=mean(MAPsmootherLL)
end

