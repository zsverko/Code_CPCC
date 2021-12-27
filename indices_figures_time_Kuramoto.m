clc;clear all;close all;
%% -------------------------------------
% ------indices calculation for synthetic signals Kuramoto------
% ------nedeed time for indices calculation of synthetic signals Kuramoto------
% ------Figures ------
% -------------------------------------




%% Data generation
% [27] Šverko, Z.; Sajovic, J.; Drevenšek, G.; Vlahini´c, S.; Rogelj, P. Generation of Oscillatory Synthetic Signal Simulating Brain Network
% Dynamics. In 2021 44th International Convention on Information, Communication and Electronic Technology (MIPRO), MEET -
% Microelectronics, Electronics and Electronic Technology, Opatija, Croatia, 27 Sept.-1 Oct. 2021; IEEE, 2021.

% Data were generated using the procedure described in [27].
% Also, the data were saved into files "ukupni_signal.mat" and "signali_volume.mat".

load('E:\Dynamic conn method\PLV and PLI vs correlation\Density scatter plot + sasa slike\hist+mjere_simulirani podaci\ukupni_signal.mat')
clear signals % because this variable is previously used for another thing
signals=mean(UK,3)';
signals=mean(UK(:,:,100),3)';

load('E:\Dynamic conn method\PLV and PLI vs correlation\Density scatter plot + sasa slike\hist+mjere_simulirani podaci\signali_volume.mat')


signals_sve(:,1:8)=signals(:,1:8);   signals_sve(:,9:16)=signals(:,17:24); signals_sve(:,17:24)=signali_volume;

%% Hilbert transform
complx_signals_sve=hilbert(signals_sve);

%% calculation of PLV, wPLI, absCPCC, imCPCC
ConnMxPLV=zeros(size(signals_sve,2),size(signals_sve,2)); % connectivity matrix for PLV
ConnMxwPLI=zeros(size(signals_sve,2),size(signals_sve,2)); % connectivity matrix for wPLI
ConnMxabsCC=zeros(size(signals_sve,2),size(signals_sve,2)); % connectivity matrix for absCPCC
ConnMxImagCC=zeros(size(signals_sve,2),size(signals_sve,2)); % connectivity matri for imCPCC




time=zeros(1,5); %5 - PLV, wPLI, absCPCC, imCPCC, absCPCC+imCPCC

tic
for chani=1:size(signals_sve,2)
    for chanj=1:size(signals_sve,2)
        ConnMxPLV(chani,chanj)=plv( squeeze(complx_signals_sve(:,chani)), squeeze(complx_signals_sve(:,chanj)) );

    end
end
t=toc;
time(1,1)=t;

tic;
for chani=1:size(signals_sve,2)
    for chanj=1:size(signals_sve,2)
        ConnMxwPLI(chani,chanj)=fun_wpli( squeeze(complx_signals_sve(:,chani)), squeeze(complx_signals_sve(:,chanj)) );
    end
end
t=toc;
time(1,2)=t;

tic;
for chani=1:size(signals_sve,2)
    for chanj=1:size(signals_sve,2)
          ConnMxabsCC(chani,chanj)=abs(dot((complx_signals_sve(:,chani))',(complx_signals_sve(:,chanj))')/(norm((complx_signals_sve(:,chani))')*norm((complx_signals_sve(:,chanj))')));
    end
end
t=toc;
time(1,3)=t;

tic;
for chani=1:size(signals_sve,2)
    for chanj=1:size(signals_sve,2)
          ConnMxImagCC(chani,chanj)= abs(imag(dot((complx_signals_sve(:,chani))',(complx_signals_sve(:,chanj))')/(norm((complx_signals_sve(:,chani))')*norm((complx_signals_sve(:,chanj))'))));  
    end
end
t=toc;
time(1,4)=t;


tic;
for chani=1:size(signals_sve,2)
    for chanj=1:size(signals_sve,2)
            korelacija=dot((complx_signals_sve(:,chani))',(complx_signals_sve(:,chanj))')/(norm((complx_signals_sve(:,chani))')*norm((complx_signals_sve(:,chanj))'));
            ConnMxabsCC(chani,chanj)= abs(korelacija);
            ConnMxImagCC(chani,chanj)= abs(imag(korelacija));        
    end
end
t=toc;
time(1,5)=t;



%% connectivity matrices for PLV, wPLI, absCPCC, imCPCC
Nsrc=size(signals_sve,2);
fontsize=16;
Fontsize=18;

figure('Name','PLV')
imagesc(squeeze(ConnMxPLV(:,:)));%c=colorbar; c.FontSize=fontsize;%c.Limits=[0 1];
c = colorbar;
c.FontSize=Fontsize;
xticks([1:Nsrc]); xtickangle(90)
yticks([1:Nsrc]);
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',12)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('{\it PLV}'),'FontSize',Fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_8a.jpg')%uncomment if you would like to save

figure('Name','wPLI')
imagesc(squeeze(ConnMxwPLI(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=Fontsize;
xticks([1:Nsrc]); xtickangle(90)
yticks([1:Nsrc]);
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',12)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('{\it wPLI}'),'FontSize',Fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_8b.jpg')%uncomment if you would like to save


figure('Name','absCPCC')
imagesc(squeeze(ConnMxabsCC(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=Fontsize;
xticks([1:Nsrc]); xtickangle(90)
yticks([1:Nsrc]);
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',12)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('{\it absCPCC}'),'FontSize',Fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_8c.jpg')%uncomment if you would like to save


figure('Name','imCPCC')
imagesc(squeeze(ConnMxImagCC(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=Fontsize;
xticks([1:Nsrc]); xtickangle(90)
yticks([1:Nsrc]);
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',12)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('{\it imCPCC}'),'FontSize',Fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_8d.jpg')%uncomment if you would like to save




%% histograms
% shows phase difference distributions for real -life signals for selected electrode pairs. 
% The selection includes the pair with highest PLV and absCPCC (a), 
% highest wPLI and imCPCC (b), 
% highest ratio between imCPCC and absCPCC (c) 
% and highes ratio between absCPCC and imCPCC (d).

%% a) highest PLV and absCPCC
ConnMxPLV_a=ConnMxPLV;
a=eye(size(ConnMxPLV_a,2));
b=~a;
ConnMxPLV_a=ConnMxPLV_a.*b;

[M1_PLV,I1_PLV]=max(ConnMxPLV_a);
[M2_PLV,I2_PLV]=max(max(ConnMxPLV_a));
ConnMxPLV_a(I1_PLV(I2_PLV),I2_PLV)% da nam vrijednost van
sprintf('The highest PLV is between %d i %d electrodes, and is equal to %.4f',I1_PLV(I2_PLV),I2_PLV, ConnMxPLV_a(I1_PLV(I2_PLV),I2_PLV) )


ConnMxabsCC_a=ConnMxabsCC;
ConnMxabsCC_a=ConnMxabsCC_a.*b;
[M3_absCC,I3_absCC]=max(ConnMxabsCC_a);
[M4_absCC,I4_absCC]=max(max(ConnMxabsCC_a));
ConnMxabsCC_a(I3_absCC(I4_absCC),I4_absCC)% da nam vrijednost van
sprintf('The highest absCPCC is between %d i %d electrodes, and is equal to %.4f',I3_absCC(I4_absCC),I4_absCC, ConnMxabsCC_a(I3_absCC(I4_absCC),I4_absCC) )

FontSize=14;
fontsize=18;
figure('Name','The selection includes the pair with highest PLV and absCPCC (a)')
formatSpec='%.3f';
hist( wrapToPi(angle(complx_signals_sve(:,I3_absCC(I4_absCC)))-angle(complx_signals_sve(:,I4_absCC))),100)
xticks([-pi,-pi/2,0,pi/2,pi]); xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});xlim([-pi, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',fontsize)
xlabel({'phase differences [radians]';},'fontsize',fontsize)
ylabel('bins','fontsize',fontsize)
title({strcat('Channels 24-17: {\it PLV}=',num2str(ConnMxPLV(I3_absCC(I4_absCC),I4_absCC),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC(I3_absCC(I4_absCC),I4_absCC),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI(I3_absCC(I4_absCC),I4_absCC),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC(I3_absCC(I4_absCC),I4_absCC),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_9a.jpg')%uncomment if you would like to save


%% b) highest wPLI and imCPCC
ConnMxwPLI_b=ConnMxwPLI;


[M1_wPLI,I1_wPLI]=max(ConnMxwPLI_b);
[M2_wPLI,I2_wPLI]=max(max(ConnMxwPLI_b));
ConnMxwPLI_b(I1_wPLI(I2_wPLI),I2_wPLI)% da nam vrijednost van
sprintf('The highest wPLI is between %d i %d electrodes, and is equal to %.4f',I1_wPLI(I2_wPLI),I2_wPLI, ConnMxwPLI_b(I1_wPLI(I2_wPLI),I2_wPLI) )


ConnMxImagCC_b=ConnMxImagCC;
[M3_ImagCC,I3_ImagCC]=max(ConnMxImagCC_b);
[M4_ImagCC,I4_ImagCC]=max(max(ConnMxImagCC_b));
ConnMxImagCC_b(I3_ImagCC(I4_ImagCC),I4_ImagCC)% da nam vrijednost van
sprintf('The highest imCPCC is between %d i %d electrodes, and is equal to %.4f',I3_ImagCC(I4_ImagCC),I4_ImagCC, ConnMxImagCC_b(I3_ImagCC(I4_ImagCC),I4_ImagCC) )

figure('Name','highest wPLI and imCPCC (b)')
hist( wrapToPi(angle(complx_signals_sve(:,I3_ImagCC(I4_ImagCC)))-angle(complx_signals_sve(:,I4_ImagCC))),100)
xticks([-pi,-pi/2,0,pi/2,pi]); xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});xlim([-pi, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',fontsize)
xlabel({'phase differences [radians]'},'fontsize',fontsize)
ylabel('bins','fontsize',fontsize)
title({strcat('Channels 7-3: {\it PLV}=',num2str(ConnMxPLV(I3_ImagCC(I4_ImagCC),I4_ImagCC),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC(I3_ImagCC(I4_ImagCC),I4_ImagCC),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI(I3_ImagCC(I4_ImagCC),I4_ImagCC),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC(I3_ImagCC(I4_ImagCC),I4_ImagCC),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_9b.jpg')%uncomment if you would like to save


%% c) highest ratio between imCPCC and absCPCC
r_im_abs=ConnMxImagCC_b./ConnMxabsCC_a;

[M1_r_im_abs,I1_r_im_abs]=max(r_im_abs);
[M2_r_im_abs,I2_r_im_abs]=max(max(r_im_abs));
r_im_abs(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs)% da nam vrijednost van
sprintf('The highest ratio between imCPCC and absCPCC is between electrodes %d and %d , and is equal to %.4f',I1_r_im_abs(I2_r_im_abs),I2_r_im_abs, r_im_abs(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs) )

figure('Name','c) highest ratio between imCPCC and absCPCC')
hist( wrapToPi(angle(complx_signals_sve(:,I1_r_im_abs(I2_r_im_abs)))-angle(complx_signals_sve(:,I2_r_im_abs))),100)
xticks([-pi,-pi/2,0,pi/2,pi]); xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});xlim([-pi, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',fontsize)
xlabel({'phase differences [radians]'},'fontsize',fontsize)
ylabel('bins','fontsize',fontsize)
title({strcat('Channels 4-2: {\it PLV}=',num2str(ConnMxPLV(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_9c.jpg')%uncomment if you would like to save

%% d) highes ratio between absCPCC and imCPCC 
r_abs_im=ConnMxabsCC_a./ConnMxImagCC_b;

[M1_r_abs_im,I1_r_abs_im]=max(r_abs_im);
[M2_r_abs_im,I2_r_abs_im]=max(max(r_abs_im));
r_abs_im(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im)% da nam vrijednost van
sprintf('The highest ratio between absCPCC and imCPCC is between electrodes %d and %d , and is equal to %.4f',I1_r_abs_im(I2_r_abs_im),I2_r_abs_im, r_abs_im(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im) )

figure('Name','d) highes ratio between absCPCC and imCPCC')
hist( wrapToPi(angle(complx_signals_sve(:,I1_r_abs_im(I2_r_abs_im)))-angle(complx_signals_sve(:,I2_r_abs_im))),100)
xticks([-pi,-pi/2,0,pi/2,pi]); xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});xlim([-pi, pi]); 
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',fontsize)
xlabel({'phase differences [radians]'},'fontsize',fontsize)
ylabel('bins','fontsize',fontsize)
title({strcat('Channels 19-18: {\it PLV}=',num2str(ConnMxPLV(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_9d.jpg')%uncomment if you would like to save


%% Scatter plot
Fontsize=18;
figure('Name','PLV vs absCC ','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV(:,:),[],1);
MxabsCC=reshape(ConnMxabsCC(:,:),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=Fontsize;
hold on; h2=plot([0,1], [0,mean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;h3=plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',Fontsize);ylabel('{\it absCPCC}','FontSize',Fontsize)
ax=gca;ax.XAxis.FontSize=Fontsize;ax.YAxis.FontSize=Fontsize;
legend([h2,h3],'linear fit','identity','FontSize',Fontsize);
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_7a.jpg')%uncomment if you would like to save


figure('Name','wPLI vs ImagCC ','Position',[10,10,700,500])
ConnMxwPLI(isnan(ConnMxwPLI))=0;
MxwPLI=reshape(ConnMxwPLI(:,:),[],1);
MxImagCC=reshape(ConnMxImagCC(:,:),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=Fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',Fontsize);ylabel('{\it imCPCC}','FontSize',Fontsize)
ax=gca;ax.XAxis.FontSize=Fontsize;ax.YAxis.FontSize=Fontsize;
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_7b.jpg')%uncomment if you would like to save



%% Table - correlations between methods
Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV,MxabsCC);corr(MxwPLI,MxabsCC)];
Imag_CC_sve_corr=[corr(MxPLV,MxImagCC);corr(MxwPLI,MxImagCC)];

T2=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - times
Frekvencije={'8 -12 Hz'};
PLV=[time(1,1)];
wPLI=[time(1,2)];
absCC_ImagCC=[time(1,5)];

T_time=table(Frekvencije, PLV, wPLI, absCC_ImagCC)

sprintf('The analysis of the EEG signals using the newly proposed connectivity measures was (in average) %.2f times faster',mean((PLV+wPLI)./absCC_ImagCC) )

