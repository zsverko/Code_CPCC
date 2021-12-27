clc;clear all;close all;
%% -------------------------------------
% ------Code to generate Figure 3------
% -------------------------------------




%% Figure 3a

%% Initial information
Fs=250;% sampling rate
dt=1/Fs; % sample size in seconds
StopTime=2100; % lenght of signal in seconds
t=(0:dt:StopTime-dt); % time vector
f0=10;  % central frequency
N=length(t);
sigma=0.6;
delta_fi=sigma*randn(1,N);
sig0= sin(2*pi*f0*t);


%% First histogram
% first signal = sine(wt)
% second signal= sine(wt+fi+delta_fi)
% fi=0 degrees;
% Delta_fi – is gaussian noise
sig4= sin(2*pi*f0*t + delta_fi );



%% Second histogram
N=length(t);
sigma=0.7;
delta_fi=sigma*randn(1,N);
% first signal = sine(wt)
% second signal= sine(wt+fi+delta_fi)
% fi=45 degrees;
% Delta_fi – is gaussian noise
fi=pi/4;
sig5= sin(2*pi*f0*t + fi+ delta_fi );



%% Third histogram
N=length(t);
sigma=0.9;
delta_fi=sigma*randn(1,N);
% first signal = sine(wt)
% second signal= sine(wt+fi+delta_fi)
% fi=90 degrees;
% Delta_fi – is gaussian noise
fi=pi/2;
sig6= sin(2*pi*f0*t + fi+ delta_fi );



%% Drawing
signali_svi=[sig0;sig4;sig5;sig6];
complx_signals_sve=hilbert(signali_svi');

formatSpec='%.3f';
FontSize=16;
figure('Name','Histogram (a)')
[N,X]=hist( wrapToPi(angle(complx_signals_sve(:,2))-angle(complx_signals_sve(:,1))),500);
Bh1=bar(X,N,'facecolor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980])
xticks([-pi,-pi/2,0,pi/2,pi]); xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});xlim([-pi, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',16)
ylabel('bins','fontsize',16)


hold on;
[N,X]=hist( wrapToPi(angle(complx_signals_sve(:,3))-angle(complx_signals_sve(:,2))),500);
Bh2=bar(X,N,'facecolor',[0.3010 0.7450 0.9330],'EdgeColor',[0.3010 0.7450 0.9330])
xticks([-pi,-pi/2,0,pi/2,pi]); xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});xlim([-pi, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',16)
ylabel('bins','fontsize',16)


hold on;
[N,X]=hist( wrapToPi(angle(complx_signals_sve(:,4))-angle(complx_signals_sve(:,2))),500);
Bh3=bar(X,N,'facecolor',[0.9290 0.6940 0.1250],'EdgeColor',[0.9290 0.6940 0.1250])
xticks([-pi/2,0,pi/2,pi]); xticklabels({'-\pi/2','0','\pi/2','\pi'});xlim([-pi/2, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',16)
xlabel({'phase differences [radians]'},'fontsize',16)
ylabel('bins','fontsize',16)
grid on


% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_3a.jpg')%uncomment if you would like to save














%% Figure 3b

%% Initial information
Fs=250;% sampling rate
dt=1/Fs; % sample size in seconds
StopTime=1000; % lenght of signal in seconds
t=(0:dt:StopTime-dt); % time vector
f0=10;  % central frequency
N=length(t);
sigma=0.3;
delta_fi=sigma*randn(1,N);
sig01= sin(2*pi*f0*t);

%% First histogram
% first signal = sine(wt)
% second signal= sine(wt+fi+delta_fi)
% fi=0 degrees;
% Delta_fi – is gaussian noise
sig1= sin(2*pi*f0*t + delta_fi );


%% Second histogram
% first signal = sine(wt)
% second signal= sine(wt+fi+delta_fi)
% fi=45 degrees;
% Delta_fi – is gaussian noise
Fs=250;% sampling rate
dt=1/Fs; % sample size in seconds
StopTime=1850; % lenght of signal in seconds
t=(0:dt:StopTime-dt); % time vector
f0=10;  % central frequency
N=length(t);
sigma=0.6;
delta_fi=sigma*randn(1,N);
sig02= sin(2*pi*f0*t);
fi=pi/4;
sig2= sin(2*pi*f0*t + fi+ delta_fi );


%% Third histogram 
% first signal = sine(wt)
% second signal= sine(wt+fi+delta_fi)
% fi=90 degrees;
% Delta_fi – is gaussian noise
Fs=250;% sampling rate
dt=1/Fs; % sample size in seconds
StopTime=950; % lenght of signal in seconds
t=(0:dt:StopTime-dt); % time vector
f0=10;  % central frequency
N=length(t);
sigma=0.3;
delta_fi=sigma*randn(1,N);
sig03= sin(2*pi*f0*t);
fi=pi/2;
sig3= sin(2*pi*f0*t + fi+ delta_fi );


%% Drawing
% signali_svi=[sig0;sig1;sig2;sig3];
% complx_signals_sve=hilbert(signali_svi');

formatSpec='%.3f';
FontSize=16;
figure('Name','Histogram (b)')
% [N,X]=hist( wrapToPi(angle(complx_signals_sve(:,2))-angle(complx_signals_sve(:,1))),500);
[N,X]=hist( wrapToPi(angle(hilbert(sig1))-angle(hilbert(sig01))),500);
Bh1=bar(X,N,'facecolor',[0.9290 0.6940 0.1250],'EdgeColor',[0.9290 0.6940 0.1250])
xticks([-pi,-pi/2,0,pi/2,pi]); xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});xlim([-pi, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',16)
ylabel('bins','fontsize',16)


hold on;
% [N,X]=hist( wrapToPi(angle(complx_signals_sve(:,3))-angle(complx_signals_sve(:,2))),500);
[N,X]=hist( wrapToPi(angle(hilbert(sig2))-angle(hilbert(sig02))),500);
Bh2=bar(X,N,'facecolor',[0.3010 0.7450 0.9330],'EdgeColor',[0.3010 0.7450 0.9330])
xticks([-pi,-pi/2,0,pi/2,pi]); xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});xlim([-pi, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',16)
ylabel('bins','fontsize',16)


hold on;
% [N,X]=hist( wrapToPi(angle(complx_signals_sve(:,4))-angle(complx_signals_sve(:,2))),500);
[N,X]=hist( wrapToPi(angle(hilbert(sig3))-angle(hilbert(sig03))),500);

Bh3=bar(X,N,'facecolor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980])
xticks([-pi/2,0,pi/2,pi]); xticklabels({'-\pi/2','0','\pi/2','\pi'});xlim([-pi/2, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',16)
xlabel({'phase differences [radians]'},'fontsize',16)
ylabel('bins','fontsize',16)
grid on


% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_3b.jpg') %uncomment if you would like to save













