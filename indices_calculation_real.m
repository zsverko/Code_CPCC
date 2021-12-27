clc;clear all;close all;

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


%% Import data ; Calculation of: PLV, PLI, wPLI, absCPCC, imCPCC
% odd numbers - EC, even numbers - EO
ConnMxPLV_uk=zeros(64,64,7,size(export_names,1)); % connectivity matrices for PLV - dimension (electrodes x electrodes x bands x participants)
ConnMxPLI_uk=zeros(64,64,7,size(export_names,1)); % connectivity matrices for PLI - dimension (electrodes x electrodes x bands x participants)
ConnMxwPLI_uk=zeros(64,64,7,size(export_names,1)); % connectivity matrices for wPLI - dimension (electrodes x electrodes x bands x participants)
ConnMxabsCC_uk=zeros(64,64,7,size(export_names,1)); % connectivity matrices for absCPCC - dimension (electrodes x electrodes x bands x participants)
ConnMxImagCC_uk=zeros(64,64,7,size(export_names,1)); % connectivity matrices for imCPCC - dimension (electrodes x electrodes x bands x participants)
time=zeros(size(export_names,1),5,7); % time needed for calculation of indices: dimension (participants, 5- PLV,PLI,wPLI, absCC, ImagCC, 7 -uk (0.5-45 Hz), DE, TH, AL, LB, HB , GA )

for i=1:size(export_names,1)
    %% Import preprocessing data (preprocessing data is produced by "offline_preprocessing_real.mat")
    path_import='E:\Dynamic conn method\PLV and PLI vs correlation\Real data\After preprocessing\';
    name_import_1=char(export_names(i))
    path_all=strcat(path_import,name_import_1);
    load(path_all)
    %% Hilbert transform to get analytic signal
    complex_data_uk=hilbert(EEG.data');
    complex_data_DE=hilbert(EEG_v1.EEG_DE.data');
    complex_data_TH=hilbert(EEG_v1.EEG_TH.data');
    complex_data_AL=hilbert(EEG_v1.EEG_AL.data');
    complex_data_LB=hilbert(EEG_v1.EEG_LB.data');
    complex_data_HB=hilbert(EEG_v1.EEG_HB.data');
    complex_data_GA=hilbert(EEG_v1.EEG_GA.data');

    
    nrE1=EEG.nbchan;
    %% PLV
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV_uk(chani,chanj,1,i)= plv( squeeze(complex_data_uk(:,chani)), squeeze(complex_data_uk(:,chanj)) );
        end
    end
    t=toc;
    time(i,1,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV_uk(chani,chanj,2,i)= plv( squeeze(complex_data_DE(:,chani)), squeeze(complex_data_DE(:,chanj)) );
        end
    end
    t=toc;
    time(i,1,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV_uk(chani,chanj,3,i)= plv( squeeze(complex_data_TH(:,chani)), squeeze(complex_data_TH(:,chanj)) );
        end
    end
    t=toc;
    time(i,1,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV_uk(chani,chanj,4,i)= plv( squeeze(complex_data_AL(:,chani)), squeeze(complex_data_AL(:,chanj)) );
        end
    end
    t=toc;
    time(i,1,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV_uk(chani,chanj,5,i)= plv( squeeze(complex_data_LB(:,chani)), squeeze(complex_data_LB(:,chanj)) );
        end
    end
    t=toc;
    time(i,1,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV_uk(chani,chanj,6,i)= plv( squeeze(complex_data_HB(:,chani)), squeeze(complex_data_HB(:,chanj)) );
        end
    end
    t=toc;
    time(i,1,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV_uk(chani,chanj,7,i)= plv( squeeze(complex_data_GA(:,chani)), squeeze(complex_data_GA(:,chanj)) );
        end
    end
    t=toc;
    time(i,1,7)=t;
    
    %% PLI
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI_uk(chani,chanj,1,i)= fun_pli( squeeze(complex_data_uk(:,chani)), squeeze(complex_data_uk(:,chanj)) );
        end
    end
    t=toc;
    time(i,2,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI_uk(chani,chanj,2,i)= fun_pli( squeeze(complex_data_DE(:,chani)), squeeze(complex_data_DE(:,chanj)) );
        end
    end
    t=toc;
    time(i,2,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI_uk(chani,chanj,3,i)= fun_pli( squeeze(complex_data_TH(:,chani)), squeeze(complex_data_TH(:,chanj)) );
        end
    end
    t=toc;
    time(i,2,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI_uk(chani,chanj,4,i)= fun_pli( squeeze(complex_data_AL(:,chani)), squeeze(complex_data_AL(:,chanj)) );
        end
    end
    t=toc;
    time(i,2,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI_uk(chani,chanj,5,i)= fun_pli( squeeze(complex_data_LB(:,chani)), squeeze(complex_data_LB(:,chanj)) );
        end
    end
    t=toc;
    time(i,2,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI_uk(chani,chanj,6,i)= fun_pli( squeeze(complex_data_HB(:,chani)), squeeze(complex_data_HB(:,chanj)) );
        end
    end
    t=toc;
    time(i,2,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI_uk(chani,chanj,7,i)= fun_pli( squeeze(complex_data_GA(:,chani)), squeeze(complex_data_GA(:,chanj)) );
        end
    end
    t=toc;
    time(i,2,7)=t;

    %% wPLI
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI_uk(chani,chanj,1,i)= fun_wpli( squeeze(complex_data_uk(:,chani)), squeeze(complex_data_uk(:,chanj)) );
        end
    end
    t=toc;
    time(i,3,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI_uk(chani,chanj,2,i)= fun_wpli( squeeze(complex_data_DE(:,chani)), squeeze(complex_data_DE(:,chanj)) );
        end
    end
    t=toc;
    time(i,3,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI_uk(chani,chanj,3,i)= fun_wpli( squeeze(complex_data_TH(:,chani)), squeeze(complex_data_TH(:,chanj)) );
        end
    end
    t=toc;
    time(i,3,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI_uk(chani,chanj,4,i)= fun_wpli( squeeze(complex_data_AL(:,chani)), squeeze(complex_data_AL(:,chanj)) );
        end
    end
    t=toc;
    time(i,3,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI_uk(chani,chanj,5,i)= fun_wpli( squeeze(complex_data_LB(:,chani)), squeeze(complex_data_LB(:,chanj)) );
        end
    end
    t=toc;
    time(i,3,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI_uk(chani,chanj,6,i)= fun_wpli( squeeze(complex_data_HB(:,chani)), squeeze(complex_data_HB(:,chanj)) );
        end
    end
    t=toc;
    time(i,3,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI_uk(chani,chanj,7,i)= fun_wpli( squeeze(complex_data_GA(:,chani)), squeeze(complex_data_GA(:,chanj)) );
        end
    end
    t=toc;
    time(i,3,7)=t;
    
    
%% absCPCC
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC_uk(chani,chanj,1,i)= abs(dot((complex_data_uk(:,chani))',(complex_data_uk(:,chanj))')/(norm((complex_data_uk(:,chani))')*norm((complex_data_uk(:,chanj))')));

        end
    end
    t=toc;
    time(i,4,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC_uk(chani,chanj,2,i)= abs(dot((complex_data_DE(:,chani))',(complex_data_DE(:,chanj))')/(norm((complex_data_DE(:,chani))')*norm((complex_data_DE(:,chanj))')));

        end
    end
    t=toc;
    time(i,4,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC_uk(chani,chanj,3,i)= abs(dot((complex_data_TH(:,chani))',(complex_data_TH(:,chanj))')/(norm((complex_data_TH(:,chani))')*norm((complex_data_TH(:,chanj))')));

        end
    end
    t=toc;
    time(i,4,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC_uk(chani,chanj,4,i)= abs(dot((complex_data_AL(:,chani))',(complex_data_AL(:,chanj))')/(norm((complex_data_AL(:,chani))')*norm((complex_data_AL(:,chanj))')));

        end
    end
    t=toc;
    time(i,4,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC_uk(chani,chanj,5,i)= abs(dot((complex_data_LB(:,chani))',(complex_data_LB(:,chanj))')/(norm((complex_data_LB(:,chani))')*norm((complex_data_LB(:,chanj))')));

        end
    end
    t=toc;
    time(i,4,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC_uk(chani,chanj,6,i)= abs(dot((complex_data_HB(:,chani))',(complex_data_HB(:,chanj))')/(norm((complex_data_HB(:,chani))')*norm((complex_data_HB(:,chanj))')));

        end
    end
    t=toc;
    time(i,4,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC_uk(chani,chanj,7,i)= abs(dot((complex_data_GA(:,chani))',(complex_data_GA(:,chanj))')/(norm((complex_data_GA(:,chani))')*norm((complex_data_GA(:,chanj))')));

        end
    end
    t=toc;
    time(i,4,7)=t;
%% imCPCC
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC_uk(chani,chanj,1,i)= abs(imag(dot((complex_data_uk(:,chani))',(complex_data_uk(:,chanj))')/(norm((complex_data_uk(:,chani))')*norm((complex_data_uk(:,chanj))'))));

        end
    end
    t=toc;
    time(i,5,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC_uk(chani,chanj,2,i)= abs(imag(dot((complex_data_DE(:,chani))',(complex_data_DE(:,chanj))')/(norm((complex_data_DE(:,chani))')*norm((complex_data_DE(:,chanj))'))));

        end
    end
    t=toc;
    time(i,5,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC_uk(chani,chanj,3,i)= abs(imag(dot((complex_data_TH(:,chani))',(complex_data_TH(:,chanj))')/(norm((complex_data_TH(:,chani))')*norm((complex_data_TH(:,chanj))'))));

        end
    end
    t=toc;
    time(i,5,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC_uk(chani,chanj,4,i)= abs(imag(dot((complex_data_AL(:,chani))',(complex_data_AL(:,chanj))')/(norm((complex_data_AL(:,chani))')*norm((complex_data_AL(:,chanj))'))));

        end
    end
    t=toc;
    time(i,5,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC_uk(chani,chanj,5,i)= abs(imag(dot((complex_data_LB(:,chani))',(complex_data_LB(:,chanj))')/(norm((complex_data_LB(:,chani))')*norm((complex_data_LB(:,chanj))'))));

        end
    end
    t=toc;
    time(i,5,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC_uk(chani,chanj,6,i)= abs(imag(dot((complex_data_HB(:,chani))',(complex_data_HB(:,chanj))')/(norm((complex_data_HB(:,chani))')*norm((complex_data_HB(:,chanj))'))));

        end
    end
    t=toc;
    time(i,5,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC_uk(chani,chanj,7,i)= abs(imag(dot((complex_data_GA(:,chani))',(complex_data_GA(:,chanj))')/(norm((complex_data_GA(:,chani))')*norm((complex_data_GA(:,chanj))'))));

        end
    end
    t=toc;
    time(i,5,7)=t;
    
    
    
%% absCPCC & imCPCC for time saving; because: absCPCC & imCPCC could be used to replace both PLV and wPLI and these is more appropriate for comparison calculation time
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_uk(:,chani))',(complex_data_uk(:,chanj))')/(norm((complex_data_uk(:,chani))')*norm((complex_data_uk(:,chanj))'));
            ConnMxabsCC_uk(chani,chanj,1,i)= abs(korelacija);
            ConnMxImagCC_uk(chani,chanj,1,i)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(i,6,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_DE(:,chani))',(complex_data_DE(:,chanj))')/(norm((complex_data_DE(:,chani))')*norm((complex_data_DE(:,chanj))'));
            ConnMxabsCC_uk(chani,chanj,2,i)= abs(korelacija);
            ConnMxImagCC_uk(chani,chanj,2,i)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(i,6,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_TH(:,chani))',(complex_data_TH(:,chanj))')/(norm((complex_data_TH(:,chani))')*norm((complex_data_TH(:,chanj))'));
            ConnMxabsCC_uk(chani,chanj,3,i)= abs(korelacija);
            ConnMxImagCC_uk(chani,chanj,3,i)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(i,6,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_AL(:,chani))',(complex_data_AL(:,chanj))')/(norm((complex_data_AL(:,chani))')*norm((complex_data_AL(:,chanj))'));
            ConnMxabsCC_uk(chani,chanj,4,i)= abs(korelacija);
            ConnMxImagCC_uk(chani,chanj,4,i)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(i,6,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_LB(:,chani))',(complex_data_LB(:,chanj))')/(norm((complex_data_LB(:,chani))')*norm((complex_data_LB(:,chanj))'));
            ConnMxabsCC_uk(chani,chanj,5,i)= abs(korelacija);
            ConnMxImagCC_uk(chani,chanj,5,i)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(i,6,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_HB(:,chani))',(complex_data_HB(:,chanj))')/(norm((complex_data_HB(:,chani))')*norm((complex_data_HB(:,chanj))'));
            ConnMxabsCC_uk(chani,chanj,6,i)= abs(korelacija);
            ConnMxImagCC_uk(chani,chanj,6,i)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(i,6,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_GA(:,chani))',(complex_data_GA(:,chanj))')/(norm((complex_data_GA(:,chani))')*norm((complex_data_GA(:,chanj))'));
            ConnMxabsCC_uk(chani,chanj,7,i)= abs(korelacija);
            ConnMxImagCC_uk(chani,chanj,7,i)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(i,6,7)=t;
    
    
    
    clearvars -except export_names i ConnMxPLV_uk ConnMxPLI_uk ConnMxwPLI_uk ConnMxabsCC_uk ConnMxImagCC_uk time
end
    
    

%% Save Workspace
% I suggest you save your data on your path so that you can research faster in the future (just one repeat this procedure is enough, 
% you do not have to recalculate it every time you want to use this data for your research).

% save('path/name')
