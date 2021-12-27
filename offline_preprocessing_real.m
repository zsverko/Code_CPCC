clc;clear all;close all;
%% -------------------------------------
% ------Offline preprocessing - real data ------
% -------------------------------------

%% Data availability:
%[28] Torkamani Azar, M.; Kanik, S.D.; Aydin, S.; Cetin, M. Prediction of reaction time and vigilance variability from spatio-spectral
%features of resting-state EEG in a long sustained attention task. IEEE J Biomed Health Inform 2020, 24, 2550–2558.
% get the free subset of SPIS Resting-State EEG Dataset : 
%   https://github.com/mastaneht/SPIS-Resting-State-Dataset

%% Filename initialization

filenames={'S02_restingPre_EC.mat';'S02_restingPre_EO.mat'...
    ;'S03_restingPre_EC.mat';'S03_restingPre_EO.mat'...
    ;'S04_restingPre_EC.mat';'S04_restingPre_EO.mat'...
    ;'S05_restingPre_EC.mat';'S05_restingPre_EO.mat'...
    ;'S06_restingPre_EC.mat';'S06_restingPre_EO.mat'...
    ;'S07_restingPre_EC.mat';'S07_restingPre_EO.mat'...
    ;'S08_restingPre_EC.mat';'S08_restingPre_EO.mat'...
    ;'S09_restingPre_EC.mat';'S09_restingPre_EO.mat'...
    ;'S10_restingPre_EC.mat';'S10_restingPre_EO.mat'...
    ;'S11_restingPre_EC.mat';'S11_restingPre_EO.mat'};

export_names={'S02_restingPre_EC_pre.mat';'S02_restingPre_EO_pre.mat'...
    ;'S03_restingPre_EC_pre.mat';'S03_restingPre_EO_pre.mat'...
    ;'S04_restingPre_EC_pre.mat';'S04_restingPre_EO_pre.mat'...
    ;'S05_restingPre_EC_pre.mat';'S05_restingPre_EO_pre.mat'...
    ;'S06_restingPre_EC_pre.mat';'S06_restingPre_EO_pre.mat'...
    ;'S07_restingPre_EC_pre.mat';'S07_restingPre_EO_pre.mat'...
    ;'S08_restingPre_EC_pre.mat';'S08_restingPre_EO_pre.mat'...
    ;'S09_restingPre_EC_pre.mat';'S09_restingPre_EO_pre.mat'...
    ;'S10_restingPre_EC_pre.mat';'S10_restingPre_EO_pre.mat'...
    ;'S11_restingPre_EC_pre.mat';'S11_restingPre_EO_pre.mat'};



for i=1:size(filenames,1)
    name_import_1=char(filenames(i));
%% open EEGLab to initialize variables
eeglab; close all;

           %% 1. Import EEG

fs=256;
path_import=strcat('E:\Dynamic conn method\PLV and PLI vs correlation\Real data\SPIS-Resting-State-Dataset-master\Pre-SART EEG\',name_import_1);
EEG = pop_importdata('dataformat','matlab','data',path_import,'setname',name_import_1(1:17),'srate',256);

%select only the first 64 channels (others are not EEG and not needed in this particular case)
EEG.data=EEG.data(1:64,:);
EEG = eeg_checkset( EEG );


%% 2. Add channel location data

EEG=pop_chanedit(EEG, 'load',{'E:\Dynamic conn method\PLV and PLI vs correlation\Real data\SPIS-Resting-State-Dataset-master\Pre-SART EEG\biosemi_64_besa_sph.besa','filetype','besa'});
EEG = eeg_checkset( EEG );

eeglab redraw; % refresh GUI using data defined in the command mode

%% 3. Re-reference to average

EEG=pop_reref(EEG,[]);

%% 3.b Multiply by 31nV=0.031 mikroV (amplifier resolution)
EEG.data=EEG.data .* (0.031);
EEG = eeg_checkset( EEG );

%% 4. Filter
EEG = pop_eegfiltnew( EEG, 'locutoff',  0.5, 'hicutoff',  45);

%% 5. Spectrum based channel rejection (z = 5)
EEG = pop_rejchan(EEG, 'elec',[1:EEG.nbchan] ,'threshold',5,'norm','on','measure','spec','freqrange',[0.5 45] );


%% 6. ICA decomposition and artifacts removal
EEG = pop_runica(EEG, 'extended',1,'interupt','on');
EEG = iclabel(EEG);
EEG = pop_icflag(EEG, [0 0.05;0.9 1;0.9 1;0.9 1;0.9 1;0.9 1;0.9 1]); 


EEG.icaact=(EEG.icaweights*EEG.icasphere)*EEG.data; % IC components 11 x samples

Bra=EEG.etc.ic_classification.ICLabel.classifications(:,1); % percentage of brain signal in recorded signal
Art=EEG.etc.ic_classification.ICLabel.classifications(:,2:7); % percentage of artefacts in recorded signal
[r_bra c_bra]=find(Bra<=0.05);% threshold for removing components
[r_art c_art]=find(Art>=0.9);% threshold for removing components

r=[r_bra;r_art];
r=unique(r);

EEG.icawinv(:,[r])=0; % columns equal to 0 - these which represents artifacts according to previous defined thresholds 
EEG.data=EEG.icawinv*EEG.icaact;

%% 7. rereference (to average) – tools- rereference the data – to average

EEG = pop_reref( EEG, []);


%% 8. Extract subbands
EEG_v1.EEG_DE = pop_eegfiltnew( EEG, 'locutoff',  0.5, 'hicutoff',  4);
EEG_v1.EEG_TH = pop_eegfiltnew( EEG, 'locutoff',  4, 'hicutoff',  8);
EEG_v1.EEG_AL = pop_eegfiltnew( EEG, 'locutoff',  8, 'hicutoff',  13);
EEG_v1.EEG_LB = pop_eegfiltnew( EEG, 'locutoff',  13, 'hicutoff',  18);
EEG_v1.EEG_HB = pop_eegfiltnew( EEG, 'locutoff',  18, 'hicutoff',  30);
EEG_v1.EEG_GA = pop_eegfiltnew( EEG, 'locutoff',  35, 'hicutoff',  45);

%% 9. save .mat data
% I suggest you save your data on your path so that you can research faster in the future (just one repeat this procedure is enough, 
% you do not have to recalculate it every time you want to use this data for your research).

% path_s1='E:\Dynamic conn method\PLV and PLI vs correlation\Real data\After preprocessing\';
% 
% name_export_1=char(export_names(i));
% save(strcat(path_s1,name_export_1));
% 
% clearvars -except filenames export_names i
end