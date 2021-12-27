clc;clear all;close all;
%% -----------------------------------------------------------------
% ------Code to generate Figure 4, Table 1, Figure 5, Figure 6, times------
% ------------------------------------------------------------------



%% Import data 
load('E:\Dynamic conn method\PLV and PLI vs correlation\Synthetic data\phase\data_for_figure_v2.mat')



%% Scatter plot - initialize values for graphs
fontsize=18;


ConnMxwPLI(isnan(ConnMxwPLI))=0;

%% PLV vs absCPCC delta

figure('Name','PLV vs absCPCC delta','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV(:,:,1),[],1);
MxabsCC=reshape(ConnMxabsCC(:,:,1),[],1);

dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;

hold on; h2=plot([0,0.8], [0,mean(MxabsCC./MxPLV)*0.8],'m','Linewidth',1);
x=0:0.005:1;y=x;hold on; h3=plot(x,y,'k');
xlim([0 0.8]);ylim([0 0.8]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
legend([h2,h3],'linear fit','identity','FontSize',fontsize);
title(strcat('0.5 - 4 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_4a.jpg')%uncomment if you would like to save




%% wPLI vs imCPCC delta
figure('Name','wPLI vs imCPCC delta','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI(:,:,1),[],1);
MxImagCC=reshape(ConnMxImagCC(:,:,1),[],1);

dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;

xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',1);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k');
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;

title(strcat('0.5 - 4 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_4b.jpg')%uncomment if you would like to save


%% PLV vs absCPCC theta

figure('Name','PLV vs absCPCC theta','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV(:,:,2),[],1);
MxabsCC=reshape(ConnMxabsCC(:,:,2),[],1);

dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;

hold on; h2=plot([0,0.4], [0,mean(MxabsCC./MxPLV)*0.4],'m','Linewidth',1);
x=0:0.005:1;y=x;hold on;plot(x,y,'k');
xlim([0 0.4]);ylim([0 0.7]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;

title(strcat('4 - 8 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_4c.jpg')%uncomment if you would like to save




%% wPLI vs imCPCC theta
figure('Name','wPLI vs imCPCC theta','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI(:,:,2),[],1);
MxImagCC=reshape(ConnMxImagCC(:,:,2),[],1);

dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;

hold on; h2=plot([0,0.07], [0,nanmean(MxImagCC./MxwPLI)*0.07],'m','Linewidth',1);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k');
xlim([0 0.07]);ylim([0 0.025]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;

title(strcat('4 - 8 \it {Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_4d.jpg')%uncomment if you would like to save


%% PLV vs absCPCC alpha

figure('Name','PLV vs absCPCC alpha','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV(:,:,3),[],1);
MxabsCC=reshape(ConnMxabsCC(:,:,3),[],1);

dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;

hold on; h2=plot([0,0.25], [0,mean(MxabsCC./MxPLV)*0.25],'m','Linewidth',1);
x=0:0.005:1;y=x;hold on;plot(x,y,'k');
xlim([0 0.25]);ylim([0 0.4]);
xlabel({'\it {PLV}'},'FontSize',fontsize);ylabel('\it {absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;

title(strcat('8 - 13 \it {Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_4e.jpg')%uncomment if you would like to save





%% wPLI vs imCPCC alpha
figure('Name','wPLI vs imCPCC alpha','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI(:,:,3),[],1);
MxImagCC=reshape(ConnMxImagCC(:,:,3),[],1);

dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;

hold on; h2=plot([0,0.06], [0,nanmean(MxImagCC./MxwPLI)*0.06],'m','Linewidth',1);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k');
xlim([0 0.06]);ylim([0 0.03]);
xlabel({'\it {wPLI}'},'FontSize',fontsize);ylabel('\it {imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;

title(strcat('8 - 13 \it {Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_4f.jpg')%uncomment if you would like to save






%% Table - Times

Frekvencije={'0.5 - 4 Hz';'4 - 8 Hz';'8 - 13 Hz';'13 - 18 Hz';'18 - 30 Hz';'35 - 45 Hz'};

PLV_svi=[time(1,1);time(1,2);time(1,3);time(1,4);time(1,5);time(1,6)];
wPLI_svi=[time(3,1);time(3,2);time(3,3);time(3,4);time(3,5);time(3,6)];
absCC_ImagCC_svi=[time(6,1);time(6,2);time(6,3);time(6,4);time(6,5);time(6,6)];
T1=table(Frekvencije, PLV_svi, wPLI_svi, absCC_ImagCC_svi)

sprintf('The analysis of the EEG signals using the newly proposed connectivity measures was (in average) %.2f times faster',mean((PLV_svi+wPLI_svi)./absCC_ImagCC_svi) )


%% Table - correlation calculated between indices values for frequency range 0.5-45 Hz
MxPLV=reshape(ConnMxPLV(:,:,7),[],1);
MxwPLI=reshape(ConnMxwPLI(:,:,7),[],1);
MxabsCC=reshape(ConnMxabsCC(:,:,7),[],1);
MxImagCC=reshape(ConnMxImagCC(:,:,7),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV,MxabsCC);corr(MxwPLI,MxabsCC)];
Imag_CC_sve_corr=[corr(MxPLV,MxImagCC);corr(MxwPLI,MxImagCC)];

T2=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)



%% Table - correlation calculated between indices values for frequency range 0.5 - 4 Hz DE
MxPLV_DE=reshape(ConnMxPLV(:,:,1),[],1);
MxwPLI_DE=reshape(ConnMxwPLI(:,:,1),[],1);
MxabsCC_DE=reshape(ConnMxabsCC(:,:,1),[],1);
MxImagCC_DE=reshape(ConnMxImagCC(:,:,1),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_DE,MxabsCC_DE);corr(MxwPLI_DE,MxabsCC_DE)];
Imag_CC_sve_corr=[corr(MxPLV_DE,MxImagCC_DE);corr(MxwPLI_DE,MxImagCC_DE)];

T_DE=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 4 - 8 Hz TH
MxPLV_TH=reshape(ConnMxPLV(:,:,2),[],1);
MxwPLI_TH=reshape(ConnMxwPLI(:,:,2),[],1);
MxabsCC_TH=reshape(ConnMxabsCC(:,:,2),[],1);
MxImagCC_TH=reshape(ConnMxImagCC(:,:,2),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_TH,MxabsCC_TH);corr(MxwPLI_TH,MxabsCC_TH)];
Imag_CC_sve_corr=[corr(MxPLV_TH,MxImagCC_TH);corr(MxwPLI_TH,MxImagCC_TH)];

T_TH=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)

%% Table - correlation calculated between indices values for frequency range 8 - 13 Hz AL
MxPLV_AL=reshape(ConnMxPLV(:,:,3),[],1);
MxwPLI_AL=reshape(ConnMxwPLI(:,:,3),[],1);
MxabsCC_AL=reshape(ConnMxabsCC(:,:,3),[],1);
MxImagCC_AL=reshape(ConnMxImagCC(:,:,3),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_AL,MxabsCC_AL);corr(MxwPLI_AL,MxabsCC_AL)];
Imag_CC_sve_corr=[corr(MxPLV_AL,MxImagCC_AL);corr(MxwPLI_AL,MxImagCC_AL)];

T_AL=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 13 - 18 Hz LB
MxPLV_LB=reshape(ConnMxPLV(:,:,4),[],1);
MxwPLI_LB=reshape(ConnMxwPLI(:,:,4),[],1);
MxabsCC_LB=reshape(ConnMxabsCC(:,:,4),[],1);
MxImagCC_LB=reshape(ConnMxImagCC(:,:,4),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_LB,MxabsCC_LB);corr(MxwPLI_LB,MxabsCC_LB)];
Imag_CC_sve_corr=[corr(MxPLV_LB,MxImagCC_LB);corr(MxwPLI_LB,MxImagCC_LB)];

T_LB=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)

%% Table - correlation calculated between indices values for frequency range 18 - 30 Hz HB
MxPLV_HB=reshape(ConnMxPLV(:,:,5),[],1);
MxwPLI_HB=reshape(ConnMxwPLI(:,:,5),[],1);
MxabsCC_HB=reshape(ConnMxabsCC(:,:,5),[],1);
MxImagCC_HB=reshape(ConnMxImagCC(:,:,5),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_HB,MxabsCC_HB);corr(MxwPLI_HB,MxabsCC_HB)];
Imag_CC_sve_corr=[corr(MxPLV_HB,MxImagCC_HB);corr(MxwPLI_HB,MxImagCC_HB)];

T_HB=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)

%% Table - correlation calculated between indices values for frequency range 35 - 45 Hz GA
MxPLV_GA=reshape(ConnMxPLV(:,:,6),[],1);
MxwPLI_GA=reshape(ConnMxwPLI(:,:,6),[],1);
MxabsCC_GA=reshape(ConnMxabsCC(:,:,6),[],1);
MxImagCC_GA=reshape(ConnMxImagCC(:,:,6),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_GA,MxabsCC_GA);corr(MxwPLI_GA,MxabsCC_GA)];
Imag_CC_sve_corr=[corr(MxPLV_GA,MxImagCC_GA);corr(MxwPLI_GA,MxImagCC_GA)];

T_GA=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)




%% Figures - connectivity matrices
fontsize=16;
Fontsize=18;

Nsrc=EEG.nbchan;
figure('Name','EC PLV')
imagesc(squeeze(ConnMxPLV(:,:,3)));%c=colorbar; c.FontSize=fontsize;%c.Limits=[0 1];
c = colorbar;
c.FontSize=Fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',10)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('{\it PLV}'),'FontSize',Fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_5a.jpg')%uncomment if you would like to save

figure('Name','EC wPLI')
imagesc(squeeze(ConnMxwPLI(:,:,3)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=Fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',10)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('{\it wPLI}'),'FontSize',Fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_5b.jpg')%uncomment if you would like to save


figure('Name','EC absCPCC')
imagesc(squeeze(ConnMxabsCC(:,:,3)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=Fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',10)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('{\it absCPCC}'),'FontSize',Fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_5c.jpg')%uncomment if you would like to save


figure('Name','EC imCPCC')
imagesc(squeeze(ConnMxImagCC(:,:,3)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=Fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',10)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('{\it imCPCC}'),'FontSize',Fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_5d.jpg')%uncomment if you would like to save

    
%% histograms
complx_signals_sve=hilbert(EEG_v1.EEG_AL.data');
%ConnMx (dimensions = electrodes x electrodes x bands) - alpha band is 3rd
% shows phase difference distributions for real -life signals for selected electrode pairs. 
% The selection includes the pair with highest PLV and absCPCC (a), 
% highest wPLI and imCPCC (b), 
% highest ratio between imCPCC and absCPCC (c) 
% and highes ratio between absCPCC and imCPCC (d).

%% a) highest PLV and absCPCC
ConnMxPLV_a=ConnMxPLV(:,:,3);
a=eye(size(ConnMxPLV_a,2));
b=~a;
ConnMxPLV_a=ConnMxPLV_a.*b;

[M1_PLV,I1_PLV]=max(ConnMxPLV_a);
[M2_PLV,I2_PLV]=max(max(ConnMxPLV_a));
ConnMxPLV_a(I1_PLV(I2_PLV),I2_PLV)% da nam vrijednost van
sprintf('The highest PLV is between %d i %d electrodes, and is equal to %.4f',I1_PLV(I2_PLV),I2_PLV, ConnMxPLV_a(I1_PLV(I2_PLV),I2_PLV) )


ConnMxabsCC_a=ConnMxabsCC(:,:,3);
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
title({strcat('Channels 16-11: {\it PLV}=',num2str(ConnMxPLV(I3_absCC(I4_absCC),I4_absCC,3),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC(I3_absCC(I4_absCC),I4_absCC,3),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI(I3_absCC(I4_absCC),I4_absCC,3),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC(I3_absCC(I4_absCC),I4_absCC,3),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_6a.jpg')%uncomment if you would like to save


%% b) highest wPLI and imCPCC
ConnMxwPLI_b=ConnMxwPLI(:,:,3);


[M1_wPLI,I1_wPLI]=max(ConnMxwPLI_b);
[M2_wPLI,I2_wPLI]=max(max(ConnMxwPLI_b));
ConnMxwPLI_b(I1_wPLI(I2_wPLI),I2_wPLI)% da nam vrijednost van
sprintf('The highest wPLI is between %d i %d electrodes, and is equal to %.4f',I1_wPLI(I2_wPLI),I2_wPLI, ConnMxwPLI_b(I1_wPLI(I2_wPLI),I2_wPLI) )


ConnMxImagCC_b=ConnMxImagCC(:,:,3);
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
title({strcat('Channels 14-12: {\it PLV}=',num2str(ConnMxPLV(I3_ImagCC(I4_ImagCC),I4_ImagCC,3),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC(I3_ImagCC(I4_ImagCC),I4_ImagCC,3),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI(I3_ImagCC(I4_ImagCC),I4_ImagCC,3),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC(I3_ImagCC(I4_ImagCC),I4_ImagCC,3),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_6b.jpg')%uncomment if you would like to save


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
title({strcat('Channels 28-25: {\it PLV}=',num2str(ConnMxPLV(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs,3),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs,3),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs,3),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs,3),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_6c.jpg')%uncomment if you would like to save

%% d) highest ratio between absCPCC and imCPCC 
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
title({strcat('Channels 15-12: {\it PLV}=',num2str(ConnMxPLV(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im,3),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im,3),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im,3),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im,3),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_6d.jpg')%uncomment if you would like to save











