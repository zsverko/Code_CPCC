clc;clear all;close all;
%% -----------------------------------------------------------------------------------------------
% ------Code to generate Figure 10, Figure 11, Table 3, Table 4, Figure 12, Figure 13, times------
% ------------------------------------------------------------------------------------------------


%% Import obradenih podataka
load('E:\Dynamic conn method\PLV and PLI vs correlation\Real data\Kod\matrix_y_dot_v2.mat')

ConnMxwPLI_uk(isnan(ConnMxwPLI_uk))=0;

% ConnMx - dimensions 64x64x7(bands)x20(10 participants - odd numbers - EC, even numbers - EO)


%% EC scatter plot
fontsize=18;
%% EC delta

%% PLV vs absCPCC
figure('Name','PLV vs absCC delta EC','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,2,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,2,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,mean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;h3=plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
legend([h2,h3],'linear fit','identity','FontSize',fontsize);
title(strcat('EC 0.5 - 4 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10a.jpg')%uncomment if you would like to save


%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC delta EC','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,2,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,2,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 0.5 - 4 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10b.jpg')%uncomment if you would like to save


%% EC theta
%% PLV vs absCPCC
figure('Name','PLV vs absCC theta EC','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,3,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,3,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,mean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 4 - 8 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10c.jpg')%uncomment if you would like to save




%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC theta EC','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,3,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,3,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 4 - 8 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10d.jpg')%uncomment if you would like to save


%% EC alpha
%% PLV vs absCPCC
figure('Name','PLV vs absCC alpha EC','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,mean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 8 - 13 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10e.jpg')%uncomment if you would like to save



%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC alpha EC','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 8 - 13 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10f.jpg')%uncomment if you would like to save


%% EC low beta
%% PLV vs absCPCC
figure('Name','PLV vs absCC low beta EC','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,5,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,5,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,mean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 13 - 18 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10g.jpg')%uncomment if you would like to save



%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC low beta EC','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,5,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,5,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 13 - 18 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10h.jpg')%uncomment if you would like to save


%% EC high beta
%% PLV vs absCPCC
figure('Name','PLV vs absCC high beta EC','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,6,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,6,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,0.8], [0,mean(MxabsCC./MxPLV)*0.8],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 18 - 30 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10i.jpg')%uncomment if you would like to save


%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC high beta EC','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,6,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,6,[1,3,5,7,9,11,13,15,17,19]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EC 18 - 30 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_10j.jpg')%uncomment if you would like to save





%% Table - Times 
% time - dimensions 20(10 participants EC i EO) x 5 (PLV,PLI,wPLI, absCC, ImagCC) x 7 (bandova)
Frekvencije={'0.5 - 4 Hz';'4 - 8 Hz';'8 - 13 Hz';'13 - 18 Hz';'18 - 30 Hz';'35 - 45 Hz'};

PLV_svi=[mean(time([1,3,5,7,9,11,13,15,17,19],1,2));mean(time([1,3,5,7,9,11,13,15,17,19],1,3));mean(time([1,3,5,7,9,11,13,15,17,19],1,4));mean(time([1,3,5,7,9,11,13,15,17,19],1,5));mean(time([1,3,5,7,9,11,13,15,17,19],1,6));mean(time([1,3,5,7,9,11,13,15,17,19],1,7))];
wPLI_svi=[mean(time([1,3,5,7,9,11,13,15,17,19],3,2));mean(time([1,3,5,7,9,11,13,15,17,19],3,3));mean(time([1,3,5,7,9,11,13,15,17,19],3,4));mean(time([1,3,5,7,9,11,13,15,17,19],3,5));mean(time([1,3,5,7,9,11,13,15,17,19],3,6));mean(time([1,3,5,7,9,11,13,15,17,19],3,7))];
absCC_ImagCC_svi=[mean(time([1,3,5,7,9,11,13,15,17,19],6,2));mean(time([1,3,5,7,9,11,13,15,17,19],6,3));mean(time([1,3,5,7,9,11,13,15,17,19],6,4));mean(time([1,3,5,7,9,11,13,15,17,19],6,5));mean(time([1,3,5,7,9,11,13,15,17,19],6,6));mean(time([1,3,5,7,9,11,13,15,17,19],6,7))];

T_EC_time=table(Frekvencije, PLV_svi, wPLI_svi, absCC_ImagCC_svi)
sprintf('The analysis of the EEG signals using the newly proposed connectivity measures was (in average) %.2f times faster',mean((PLV_svi+wPLI_svi)./absCC_ImagCC_svi) )

%% Table - correlation calculated between indices values for frequency range 0.5-45 Hz -EC
MxPLV=reshape(ConnMxPLV_uk(:,:,1,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxwPLI=reshape(ConnMxwPLI_uk(:,:,1,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,1,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,1,[1,3,5,7,9,11,13,15,17,19]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV,MxabsCC);corr(MxwPLI,MxabsCC)];
Imag_CC_sve_corr=[corr(MxPLV,MxImagCC);corr(MxwPLI,MxImagCC)];

T2=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 0.5 - 4 Hz DE -EC
MxPLV_EC_DE=reshape(ConnMxPLV_uk(:,:,2,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxwPLI_EC_DE=reshape(ConnMxwPLI_uk(:,:,2,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC_EC_DE=reshape(ConnMxabsCC_uk(:,:,2,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC_EC_DE=reshape(ConnMxImagCC_uk(:,:,2,[1,3,5,7,9,11,13,15,17,19]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EC_DE,MxabsCC_EC_DE);corr(MxwPLI_EC_DE,MxabsCC_EC_DE)];
Imag_CC_sve_corr=[corr(MxPLV_EC_DE,MxImagCC_EC_DE);corr(MxwPLI_EC_DE,MxImagCC_EC_DE)];

T_EC_DE=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)



%% Table - correlation calculated between indices values for frequency range 4 - 8 Hz TH -EC

MxPLV_EC_TH=reshape(ConnMxPLV_uk(:,:,3,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxwPLI_EC_TH=reshape(ConnMxwPLI_uk(:,:,3,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC_EC_TH=reshape(ConnMxabsCC_uk(:,:,3,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC_EC_TH=reshape(ConnMxImagCC_uk(:,:,3,[1,3,5,7,9,11,13,15,17,19]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EC_TH,MxabsCC_EC_TH);corr(MxwPLI_EC_TH,MxabsCC_EC_TH)];
Imag_CC_sve_corr=[corr(MxPLV_EC_TH,MxImagCC_EC_TH);corr(MxwPLI_EC_TH,MxImagCC_EC_TH)];

T_EC_TH=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 8 - 13 Hz AL -EC

MxPLV_EC_AL=reshape(ConnMxPLV_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxwPLI_EC_AL=reshape(ConnMxwPLI_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC_EC_AL=reshape(ConnMxabsCC_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC_EC_AL=reshape(ConnMxImagCC_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EC_AL,MxabsCC_EC_AL);corr(MxwPLI_EC_AL,MxabsCC_EC_AL)];
Imag_CC_sve_corr=[corr(MxPLV_EC_AL,MxImagCC_EC_AL);corr(MxwPLI_EC_AL,MxImagCC_EC_AL)];

T_EC_AL=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 13 - 18 Hz LB -EC

MxPLV_EC_LB=reshape(ConnMxPLV_uk(:,:,5,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxwPLI_EC_LB=reshape(ConnMxwPLI_uk(:,:,5,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC_EC_LB=reshape(ConnMxabsCC_uk(:,:,5,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC_EC_LB=reshape(ConnMxImagCC_uk(:,:,5,[1,3,5,7,9,11,13,15,17,19]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EC_LB,MxabsCC_EC_LB);corr(MxwPLI_EC_LB,MxabsCC_EC_LB)];
Imag_CC_sve_corr=[corr(MxPLV_EC_LB,MxImagCC_EC_LB);corr(MxwPLI_EC_LB,MxImagCC_EC_LB)];

T_EC_LB=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)

%% Table - correlation calculated between indices values for frequency range 18 - 30 Hz HB -EC

MxPLV_EC_HB=reshape(ConnMxPLV_uk(:,:,6,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxwPLI_EC_HB=reshape(ConnMxwPLI_uk(:,:,6,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC_EC_HB=reshape(ConnMxabsCC_uk(:,:,6,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC_EC_HB=reshape(ConnMxImagCC_uk(:,:,6,[1,3,5,7,9,11,13,15,17,19]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EC_HB,MxabsCC_EC_HB);corr(MxwPLI_EC_HB,MxabsCC_EC_HB)];
Imag_CC_sve_corr=[corr(MxPLV_EC_HB,MxImagCC_EC_HB);corr(MxwPLI_EC_HB,MxImagCC_EC_HB)];

T_EC_HB=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 35 - 45 Hz GA -EC

MxPLV_EC_GA=reshape(ConnMxPLV_uk(:,:,7,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxwPLI_EC_GA=reshape(ConnMxwPLI_uk(:,:,7,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxabsCC_EC_GA=reshape(ConnMxabsCC_uk(:,:,7,[1,3,5,7,9,11,13,15,17,19]),[],1);
MxImagCC_EC_GA=reshape(ConnMxImagCC_uk(:,:,7,[1,3,5,7,9,11,13,15,17,19]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EC_GA,MxabsCC_EC_GA);corr(MxwPLI_EC_GA,MxabsCC_EC_GA)];
Imag_CC_sve_corr=[corr(MxPLV_EC_GA,MxImagCC_EC_GA);corr(MxwPLI_EC_GA,MxImagCC_EC_GA)];

T_EC_GA=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)
















%% EO scatter plot (even numbers)


%% EO delta
fontsize=18;
%% PLV vs absCPCC

figure('Name','PLV vs absCC delta EO','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,2,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,2,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,nanmean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;h3=plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
legend([h2,h3],'linear fit','identity','FontSize',fontsize);
title(strcat('EO 0.5 - 4 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11a.jpg')%uncomment if you would like to save


%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC delta EO','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,2,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,2,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;h3=plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 0.5 - 4 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11b.jpg')%uncomment if you would like to save

%% EO theta
%% PLV vs absCPCC
figure('Name','PLV vs absCC theta EO','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,3,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,3,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,nanmean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 4 - 8 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11c.jpg')%uncomment if you would like to save





%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC theta EO','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,3,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,3,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 4 - 8 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11d.jpg')%uncomment if you would like to save


%% EO alpha
%% PLV vs absCPCC
figure('Name','PLV vs absCC alpha EO','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,nanmean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 8 - 13 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11e.jpg')%uncomment if you would like to save



%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC alpha EO','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 8 - 13 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11f.jpg')%uncomment if you would like to save


%% EO low beta
%% PLV vs absCPCC
figure('Name','PLV vs absCC low beta EO','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,5,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,5,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,nanmean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 13 - 18 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11g.jpg')%uncomment if you would like to save



%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC low beta EO','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,5,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,5,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 13 - 18 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11h.jpg')%uncomment if you would like to save


%% EO high beta
%% PLV vs absCPCC
figure('Name','PLV vs absCC high beta EO','Position',[10,10,700,500])
MxPLV=reshape(ConnMxPLV_uk(:,:,6,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,6,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxPLV,MxabsCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
hold on; h2=plot([0,1], [0,nanmean(MxabsCC./MxPLV)*1],'m','Linewidth',2);
x=0:0.005:1;y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 1]);ylim([0 1]);
xlabel({'{\it PLV}'},'FontSize',fontsize);ylabel('{\it absCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 18 - 30 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11i.jpg')%uncomment if you would like to save


%% wPLI vs imCPCC
figure('Name','wPLI vs ImagCC high beta EO','Position',[10,10,700,500])
MxwPLI=reshape(ConnMxwPLI_uk(:,:,6,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,6,[2,4,6,8,10,12,14,16,18,20]),[],1);
dscatter(MxwPLI,MxImagCC,'marker','o')
c = colorbar;
c.Label.String = 'Relative Density'; c.FontSize=fontsize;
xlim_max=max([max(MxwPLI);max(MxImagCC)]);
hold on; h2=plot([0,xlim_max], [0,nanmean(MxImagCC./MxwPLI)*xlim_max],'m','Linewidth',2);
x=0:0.005:max([max(MxwPLI);max(MxImagCC)]);y=x;hold on;plot(x,y,'k','Linewidth',2);
xlim([0 max([max(MxwPLI);max(MxImagCC)])]);ylim([0 max([max(MxwPLI);max(MxImagCC)])]);
xlabel({'{\it wPLI}'},'FontSize',fontsize);ylabel('{\it imCPCC}','FontSize',fontsize)
ax=gca;ax.XAxis.FontSize=fontsize;ax.YAxis.FontSize=fontsize;
title(strcat('EO 18 - 30 {\it Hz}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_11j.jpg')%uncomment if you would like to save


%% Table - Times EO
% time - dimensions 20(10 participants EO i EC) x 6 (PLV,PLI,wPLI, absCC, ImagCC , absCPCC+imCPCC) x 7 (bandova)
Frekvencije={'0.5 - 4 Hz';'4 - 8 Hz';'8 - 13 Hz';'13 - 18 Hz';'18 - 30 Hz';'35 - 45 Hz'};

PLV_svi=[mean(time([2,4,6,8,10,12,14,16,18,20],1,2));mean(time([2,4,6,8,10,12,14,16,18,20],1,3));mean(time([2,4,6,8,10,12,14,16,18,20],1,4));mean(time([2,4,6,8,10,12,14,16,18,20],1,5));mean(time([2,4,6,8,10,12,14,16,18,20],1,6));mean(time([2,4,6,8,10,12,14,16,18,20],1,7))];
wPLI_svi=[mean(time([2,4,6,8,10,12,14,16,18,20],3,2));mean(time([2,4,6,8,10,12,14,16,18,20],3,3));mean(time([2,4,6,8,10,12,14,16,18,20],3,4));mean(time([2,4,6,8,10,12,14,16,18,20],3,5));mean(time([2,4,6,8,10,12,14,16,18,20],3,6));mean(time([2,4,6,8,10,12,14,16,18,20],3,7))];
absCC_ImagCC_svi=[mean(time([2,4,6,8,10,12,14,16,18,20],6,2));mean(time([2,4,6,8,10,12,14,16,18,20],6,3));mean(time([2,4,6,8,10,12,14,16,18,20],6,4));mean(time([2,4,6,8,10,12,14,16,18,20],6,5));mean(time([2,4,6,8,10,12,14,16,18,20],6,6));mean(time([2,4,6,8,10,12,14,16,18,20],6,7))];

T_EO_time=table(Frekvencije, PLV_svi, wPLI_svi, absCC_ImagCC_svi)

sprintf('The analysis of the EEG signals using the newly proposed connectivity measures was (in average) %.2f times faster',mean((PLV_svi+wPLI_svi)./absCC_ImagCC_svi) )


%% Table - correlation calculated between indices values for frequency range 0.5-45 Hz - EO
MxPLV=reshape(ConnMxPLV_uk(:,:,1,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxwPLI=reshape(ConnMxwPLI_uk(:,:,1,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC=reshape(ConnMxabsCC_uk(:,:,1,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC=reshape(ConnMxImagCC_uk(:,:,1,[2,4,6,8,10,12,14,16,18,20]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV,MxabsCC);corr(MxwPLI,MxabsCC)];
Imag_CC_sve_corr=[corr(MxPLV,MxImagCC);corr(MxwPLI,MxImagCC)];

T4=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)



%% Table - correlation calculated between indices values for frequency range 0.5 - 4 Hz DE -EO
MxPLV_EO_DE=reshape(ConnMxPLV_uk(:,:,2,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxwPLI_EO_DE=reshape(ConnMxwPLI_uk(:,:,2,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC_EO_DE=reshape(ConnMxabsCC_uk(:,:,2,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC_EO_DE=reshape(ConnMxImagCC_uk(:,:,2,[2,4,6,8,10,12,14,16,18,20]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EO_DE,MxabsCC_EO_DE);corr(MxwPLI_EO_DE,MxabsCC_EO_DE)];
Imag_CC_sve_corr=[corr(MxPLV_EO_DE,MxImagCC_EO_DE);corr(MxwPLI_EO_DE,MxImagCC_EO_DE)];

T_EO_DE=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)



%% Table - correlation calculated between indices values for frequency range 4 - 8 Hz TH -EO

MxPLV_EO_TH=reshape(ConnMxPLV_uk(:,:,3,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxwPLI_EO_TH=reshape(ConnMxwPLI_uk(:,:,3,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC_EO_TH=reshape(ConnMxabsCC_uk(:,:,3,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC_EO_TH=reshape(ConnMxImagCC_uk(:,:,3,[2,4,6,8,10,12,14,16,18,20]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EO_TH,MxabsCC_EO_TH);corr(MxwPLI_EO_TH,MxabsCC_EO_TH)];
Imag_CC_sve_corr=[corr(MxPLV_EO_TH,MxImagCC_EO_TH);corr(MxwPLI_EO_TH,MxImagCC_EO_TH)];

T_EO_TH=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 8 - 13 Hz AL -EO

MxPLV_EO_AL=reshape(ConnMxPLV_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxwPLI_EO_AL=reshape(ConnMxwPLI_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC_EO_AL=reshape(ConnMxabsCC_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC_EO_AL=reshape(ConnMxImagCC_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EO_AL,MxabsCC_EO_AL);corr(MxwPLI_EO_AL,MxabsCC_EO_AL)];
Imag_CC_sve_corr=[corr(MxPLV_EO_AL,MxImagCC_EO_AL);corr(MxwPLI_EO_AL,MxImagCC_EO_AL)];

T_EO_AL=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 13 - 18 Hz LB -EO

MxPLV_EO_LB=reshape(ConnMxPLV_uk(:,:,5,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxwPLI_EO_LB=reshape(ConnMxwPLI_uk(:,:,5,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC_EO_LB=reshape(ConnMxabsCC_uk(:,:,5,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC_EO_LB=reshape(ConnMxImagCC_uk(:,:,5,[2,4,6,8,10,12,14,16,18,20]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EO_LB,MxabsCC_EO_LB);corr(MxwPLI_EO_LB,MxabsCC_EO_LB)];
Imag_CC_sve_corr=[corr(MxPLV_EO_LB,MxImagCC_EO_LB);corr(MxwPLI_EO_LB,MxImagCC_EO_LB)];

T_EO_LB=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)

%% Table - correlation calculated between indices values for frequency range 18 - 30 Hz HB -EO

MxPLV_EO_HB=reshape(ConnMxPLV_uk(:,:,6,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxwPLI_EO_HB=reshape(ConnMxwPLI_uk(:,:,6,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC_EO_HB=reshape(ConnMxabsCC_uk(:,:,6,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC_EO_HB=reshape(ConnMxImagCC_uk(:,:,6,[2,4,6,8,10,12,14,16,18,20]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EO_HB,MxabsCC_EO_HB);corr(MxwPLI_EO_HB,MxabsCC_EO_HB)];
Imag_CC_sve_corr=[corr(MxPLV_EO_HB,MxImagCC_EO_HB);corr(MxwPLI_EO_HB,MxImagCC_EO_HB)];

T_EO_HB=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)


%% Table - correlation calculated between indices values for frequency range 35 - 45 Hz GA -EO

MxPLV_EO_GA=reshape(ConnMxPLV_uk(:,:,7,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxwPLI_EO_GA=reshape(ConnMxwPLI_uk(:,:,7,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxabsCC_EO_GA=reshape(ConnMxabsCC_uk(:,:,7,[2,4,6,8,10,12,14,16,18,20]),[],1);
MxImagCC_EO_GA=reshape(ConnMxImagCC_uk(:,:,7,[2,4,6,8,10,12,14,16,18,20]),[],1);


Imena_redova={'PLV';'wPLI'};
absCC_sve_corr=[corr(MxPLV_EO_GA,MxabsCC_EO_GA);corr(MxwPLI_EO_GA,MxabsCC_EO_GA)];
Imag_CC_sve_corr=[corr(MxPLV_EO_GA,MxImagCC_EO_GA);corr(MxwPLI_EO_GA,MxImagCC_EO_GA)];

T_EO_GA=table(Imena_redova, absCC_sve_corr, Imag_CC_sve_corr)



%% Connectivity analysis - import 
load('E:\Dynamic conn method\PLV and PLI vs correlation\Real data\Kod\matrix_y_dot_v2.mat')

ConnMxwPLI_uk(isnan(ConnMxwPLI_uk))=0;

%%
%EC alpha
PLV_avg_EC_AL=mean(ConnMxPLV_uk (:,:,4,[1,3,5,7,9,11,13,15,17,19]) ,4 );
absCC_avg_EC_AL=mean(ConnMxabsCC_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]) ,4 );
wPLI_avg_EC_AL=mean(ConnMxwPLI_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]) ,4 );
ImagCC_avg_EC_AL=mean(ConnMxImagCC_uk(:,:,4,[1,3,5,7,9,11,13,15,17,19]) ,4 );

%EO alpha
PLV_avg_EO_AL=mean(ConnMxPLV_uk (:,:,4,[2,4,6,8,10,12,14,16,18,20]) ,4 );
absCC_avg_EO_AL=mean(ConnMxabsCC_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]) ,4 );
wPLI_avg_EO_AL=mean(ConnMxwPLI_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]) ,4 );
ImagCC_avg_EO_AL=mean(ConnMxImagCC_uk(:,:,4,[2,4,6,8,10,12,14,16,18,20]) ,4 );

%% Define electrode positions - using data after preprocessing 
    export_names={'S10_restingPre_EC_pre.mat'}

    path_import='E:\Dynamic conn method\PLV and PLI vs correlation\Real data\After preprocessing\';
    name_import_1=char(export_names(1))
    path_all=strcat(path_import,name_import_1);
    load(path_all)
    
 
%% EC real signal alpha band
fontsize=18;
Nsrc=EEG.nbchan;
figure('Name','EC PLV')
% subplot(2,2,1)
imagesc(squeeze(PLV_avg_EC_AL(:,:)));%c=colorbar; c.FontSize=fontsize;%c.Limits=[0 1];
c = colorbar;
c.FontSize=fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',5)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('EC {\it PLV}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_12a.jpg')%uncomment if you would like to save

figure('Name','EC wPLI')
% subplot(2,2,2)
imagesc(squeeze(wPLI_avg_EC_AL(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',5)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('EC {\it wPLI}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_12b.jpg')%uncomment if you would like to save


figure('Name','EC absCPCC')
% subplot(2,2,3)
imagesc(squeeze(absCC_avg_EC_AL(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',5)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('EC {\it absCPCC}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_12c.jpg')%uncomment if you would like to save


figure('Name','EC imCPCC')
% subplot(2,2,4)
imagesc(squeeze(ImagCC_avg_EC_AL(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',5)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('EC {\it imCPCC}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_12d.jpg')%uncomment if you would like to save

    

%% EO real signals alpha band
fontsize=16;
Nsrc=EEG.nbchan;
figure('Name','EO PLV')
% subplot(2,2,1)
imagesc(squeeze(PLV_avg_EO_AL(:,:)));%c=colorbar; c.FontSize=fontsize;%c.Limits=[0 1];
c = colorbar;
c.FontSize=fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',5)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('EO {\it PLV}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_12e.jpg')%uncomment if you would like to save

figure('Name','EO wPLI')
% subplot(2,2,2)
imagesc(squeeze(wPLI_avg_EO_AL(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',5)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('EO {\it wPLI}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_12f.jpg')%uncomment if you would like to save


figure('Name','EO absCPCC')
% subplot(2,2,3)
imagesc(squeeze(absCC_avg_EO_AL(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',5)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('EO {\it absCPCC}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_12g.jpg')%uncomment if you would like to save


figure('Name','EO imCPCC')
% subplot(2,2,4)
imagesc(squeeze(ImagCC_avg_EO_AL(:,:)));%c=colorbar; c.FontSize=8;%c.Limits=[0 1];
c = colorbar;
c.FontSize=fontsize;
xticks([1:Nsrc]); xticklabels({EEG.chanlocs.labels});xtickangle(90)
yticks([1:Nsrc]);yticklabels({EEG.chanlocs.labels});
a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',5)
set(gca,'XTickLabelMode','manual')
axis equal;axis tight;
title(strcat('EO {\it imCPCC}'),'FontSize',fontsize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_12h.jpg')%uncomment if you would like to save



%% histograms

% complx_signals_sve=hilbert(EEG.data');
complx_signals_sve=hilbert(EEG_v1.EEG_AL.data');
%ConnMx (dimensions = electrodes x electrodes x bands) - alpha band is 3rd
% shows phase difference distributions for real -life signals for selected electrode pairs. 
% The selection includes the pair with highest PLV and absCPCC (a), 
% highest wPLI and imCPCC (b), 
% highest ratio between imCPCC and absCPCC (c) 
% and highes ratio between absCPCC and imCPCC (d).

%ConnMx - dimensions(electrodes x electrodes x bands x participants) - even
%number = EC , S10 participant is equal to 18, alpha band is 4
%% S10 participant - EC
%% a) highest PLV and absCPCC
ConnMxPLV_a=ConnMxPLV_uk(:,:,4,18);
a=eye(size(ConnMxPLV_a,2));
b=~a;
ConnMxPLV_a=ConnMxPLV_a.*b;

[M1_PLV,I1_PLV]=max(ConnMxPLV_a);
[M2_PLV,I2_PLV]=max(max(ConnMxPLV_a));
ConnMxPLV_a(I1_PLV(I2_PLV),I2_PLV)% da nam vrijednost van
sprintf('The highest PLV is between %d i %d electrodes, and is equal to %.4f',I1_PLV(I2_PLV),I2_PLV, ConnMxPLV_a(I1_PLV(I2_PLV),I2_PLV) )


ConnMxabsCC_a=ConnMxabsCC_uk(:,:,4,18);
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
title({strcat('Channels 5-4: {\it PLV}=',num2str(ConnMxPLV_uk(I3_absCC(I4_absCC),I4_absCC,4,18),formatSpec),',',' {\it absCPCC}=',num2str(ConnMxabsCC_uk(I3_absCC(I4_absCC),I4_absCC,4,18),formatSpec),','),strcat(...
    ' {\it wPLI}=',num2str(ConnMxwPLI_uk(I3_absCC(I4_absCC),I4_absCC,4,18),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC_uk(I3_absCC(I4_absCC),I4_absCC,4,18),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_13a.jpg')%uncomment if you would like to save


%% b) highest wPLI and imCPCC
ConnMxwPLI_b=ConnMxwPLI_uk(:,:,4,18);


[M1_wPLI,I1_wPLI]=max(ConnMxwPLI_b);
[M2_wPLI,I2_wPLI]=max(max(ConnMxwPLI_b));
ConnMxwPLI_b(I1_wPLI(I2_wPLI),I2_wPLI)% da nam vrijednost van
sprintf('The highest wPLI is between %d i %d electrodes, and is equal to %.4f',I1_wPLI(I2_wPLI),I2_wPLI, ConnMxwPLI_b(I1_wPLI(I2_wPLI),I2_wPLI) )


ConnMxImagCC_b=ConnMxImagCC_uk(:,:,4,18);
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
title({strcat('Channels 50-46: {\it PLV}=',num2str(ConnMxPLV_uk(I3_ImagCC(I4_ImagCC),I4_ImagCC,4,18),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC_uk(I3_ImagCC(I4_ImagCC),I4_ImagCC,4,18),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI_uk(I3_ImagCC(I4_ImagCC),I4_ImagCC,4,18),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC_uk(I3_ImagCC(I4_ImagCC),I4_ImagCC,4,18),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_13b.jpg')%uncomment if you would like to save



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
title({strcat('Channels 56-49: {\it PLV}=',num2str(ConnMxPLV_uk(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs,4,18),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC_uk(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs,4,18),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI_uk(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs,4,18),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC_uk(I1_r_im_abs(I2_r_im_abs),I2_r_im_abs,4,18),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_13c.jpg')%uncomment if you would like to save


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
title({strcat('Channels 29-5: {\it PLV}=',num2str(ConnMxPLV_uk(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im,4,18),formatSpec),','),strcat(...
    ' {\it absCPCC}=',num2str(ConnMxabsCC_uk(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im,4,18),formatSpec),',',' {\it wPLI}=',num2str(ConnMxwPLI_uk(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im,4,18),formatSpec),',',' {\it imCPCC}=',num2str(ConnMxImagCC_uk(I1_r_abs_im(I2_r_abs_im),I2_r_abs_im,4,18),formatSpec))},'FontSize',FontSize)
% saveas(gcf, 'E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\fig_13d.jpg')%uncomment if you would like to save












