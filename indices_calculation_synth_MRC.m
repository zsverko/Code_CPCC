clc;clear all;close all;
%% -------------------------------------
% ------indices calculation for synthetic signals MRC------
% -------------------------------------

%% data availability
% [26] Mäkinen, V.; Tiitinen, H.; May, P. Auditory event-related responses are generated independently of ongoing brain activity.
% NeuroImage 2005, 24, 961–968.
% https://data.mrc.ox.ac.uk/data-set/simulated-eeg-data-generator

%% Data generation
% Data were generated using the procedure described in [26].
% Also, the data were saved into file data_v1.mat .

eeglab;
%% Import into eeglab
path_import='E:\Dynamic conn method\PLV and PLI vs correlation\Code CPCC\data_v1.mat';
EEG = pop_importdata('dataformat','matlab','data',path_import,'setname','synthetic signals Makinen','srate',250);
EEG = eeg_checkset( EEG );

%% Channel location import
EEG=pop_chanedit(EEG, 'load',{'E:\\Dynamic conn method\\PLV and PLI vs correlation\\Code CPCC\\nickloc31.locs','filetype','autodetect'});
EEG = eeg_checkset( EEG );

eeglab redraw; % refresh GUI using data defined in the command mode

%% some parameters needed for further analysis
Fs=EEG.srate;
nrE1=EEG.nbchan;

%% Extract subbands
EEG=pop_eegfiltnew( EEG, 'locutoff',  0.5, 'hicutoff',  45);
EEG_v1.EEG_DE = pop_eegfiltnew( EEG, 'locutoff',  0.5, 'hicutoff',  4);
EEG_v1.EEG_TH = pop_eegfiltnew( EEG, 'locutoff',  4, 'hicutoff',  8);
EEG_v1.EEG_AL = pop_eegfiltnew( EEG, 'locutoff',  8, 'hicutoff',  13);
EEG_v1.EEG_LB = pop_eegfiltnew( EEG, 'locutoff',  13, 'hicutoff',  18);
EEG_v1.EEG_HB = pop_eegfiltnew( EEG, 'locutoff',  18, 'hicutoff',  30);
EEG_v1.EEG_GA = pop_eegfiltnew( EEG, 'locutoff',  35, 'hicutoff',  45);

%% Hilbert transform to get analytic signal
mydata_complex=hilbert(EEG.data');

complex_data_DE=hilbert(EEG_v1.EEG_DE.data');
complex_data_TH=hilbert(EEG_v1.EEG_TH.data');
complex_data_AL=hilbert(EEG_v1.EEG_AL.data');
complex_data_LB=hilbert(EEG_v1.EEG_LB.data');
complex_data_HB=hilbert(EEG_v1.EEG_HB.data');
complex_data_GA=hilbert(EEG_v1.EEG_GA.data');


% Prepare storage vectors for results
%  ConnMx = electrode x electrode x bandovi
ConnMxPLV=zeros(nrE1,nrE1,7); % connectivity matrix PLV
ConnMxPLI=zeros(nrE1,nrE1,7); % connectivity matrix PLI
ConnMxwPLI=zeros(nrE1,nrE1,7); % connectivity matrux wPLI
ConnMxabsCC=zeros(nrE1,nrE1,7); % connectivity matrix absCPCC is almost equal to PLV
ConnMxImagCC=zeros(nrE1,nrE1,7); % connectivity matrix ImagCPCC is almost equal to PLI


%% PLV
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV(chani,chanj,1)= plv( squeeze(complex_data_DE(:,chani)), squeeze(complex_data_DE(:,chanj)) );
        end
    end
    t=toc;
    time(1,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV(chani,chanj,2)= plv( squeeze(complex_data_TH(:,chani)), squeeze(complex_data_TH(:,chanj)) );
        end
    end
    t=toc;
    time(1,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV(chani,chanj,3)= plv( squeeze(complex_data_AL(:,chani)), squeeze(complex_data_AL(:,chanj)) );
        end
    end
    t=toc;
    time(1,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV(chani,chanj,4)= plv( squeeze(complex_data_LB(:,chani)), squeeze(complex_data_LB(:,chanj)) );
        end
    end
    t=toc;
    time(1,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV(chani,chanj,5)= plv( squeeze(complex_data_HB(:,chani)), squeeze(complex_data_HB(:,chanj)) );
        end
    end
    t=toc;
    time(1,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV(chani,chanj,6)= plv( squeeze(complex_data_GA(:,chani)), squeeze(complex_data_GA(:,chanj)) );
        end
    end
    t=toc;
    time(1,6)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLV(chani,chanj,7)= plv( squeeze(mydata_complex(:,chani)), squeeze(mydata_complex(:,chanj)) );
        end
    end
    t=toc;
    time(1,7)=t;
  
    %% PLI
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI(chani,chanj,1)= fun_pli( squeeze(complex_data_DE(:,chani)), squeeze(complex_data_DE(:,chanj)) );
        end
    end
    t=toc;
    time(2,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI(chani,chanj,2)= fun_pli( squeeze(complex_data_TH(:,chani)), squeeze(complex_data_TH(:,chanj)) );
        end
    end
    t=toc;
    time(2,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI(chani,chanj,3)= fun_pli( squeeze(complex_data_AL(:,chani)), squeeze(complex_data_AL(:,chanj)) );
        end
    end
    t=toc;
    time(2,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI(chani,chanj,4)= fun_pli( squeeze(complex_data_LB(:,chani)), squeeze(complex_data_LB(:,chanj)) );
        end
    end
    t=toc;
    time(2,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI(chani,chanj,5)= fun_pli( squeeze(complex_data_HB(:,chani)), squeeze(complex_data_HB(:,chanj)) );
        end
    end
    t=toc;
    time(2,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI(chani,chanj,6)= fun_pli( squeeze(complex_data_GA(:,chani)), squeeze(complex_data_GA(:,chanj)) );
        end
    end
    t=toc;
    time(2,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxPLI(chani,chanj,7)= fun_pli( squeeze(mydata_complex(:,chani)), squeeze(mydata_complex(:,chanj)) );
        end
    end
    t=toc;
    time(2,7)=t;
    
    %% wPLI
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI(chani,chanj,1)= fun_wpli( squeeze(complex_data_DE(:,chani)), squeeze(complex_data_DE(:,chanj)) );
        end
    end
    t=toc;
    time(3,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI(chani,chanj,2)= fun_wpli( squeeze(complex_data_TH(:,chani)), squeeze(complex_data_TH(:,chanj)) );
        end
    end
    t=toc;
    time(3,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI(chani,chanj,3)= fun_wpli( squeeze(complex_data_AL(:,chani)), squeeze(complex_data_AL(:,chanj)) );
        end
    end
    t=toc;
    time(3,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI(chani,chanj,4)= fun_wpli( squeeze(complex_data_LB(:,chani)), squeeze(complex_data_LB(:,chanj)) );
        end
    end
    t=toc;
    time(3,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI(chani,chanj,5)= fun_wpli( squeeze(complex_data_HB(:,chani)), squeeze(complex_data_HB(:,chanj)) );
        end
    end
    t=toc;
    time(3,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI(chani,chanj,6)= fun_wpli( squeeze(complex_data_GA(:,chani)), squeeze(complex_data_GA(:,chanj)) );
        end
    end
    t=toc;
    time(3,6)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxwPLI(chani,chanj,7)= fun_wpli( squeeze(mydata_complex(:,chani)), squeeze(mydata_complex(:,chanj)) );
        end
    end
    t=toc;
    time(3,7)=t;
    
%% absCPCC
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC(chani,chanj,1)= abs(dot((complex_data_DE(:,chani))',(complex_data_DE(:,chanj))')/(norm((complex_data_DE(:,chani))')*norm((complex_data_DE(:,chanj))')));

        end
    end
    t=toc;
    time(4,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC(chani,chanj,2)= abs(dot((complex_data_TH(:,chani))',(complex_data_TH(:,chanj))')/(norm((complex_data_TH(:,chani))')*norm((complex_data_TH(:,chanj))')));

        end
    end
    t=toc;
    time(4,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC(chani,chanj,3)= abs(dot((complex_data_AL(:,chani))',(complex_data_AL(:,chanj))')/(norm((complex_data_AL(:,chani))')*norm((complex_data_AL(:,chanj))')));

        end
    end
    t=toc;
    time(4,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC(chani,chanj,4)= abs(dot((complex_data_LB(:,chani))',(complex_data_LB(:,chanj))')/(norm((complex_data_LB(:,chani))')*norm((complex_data_LB(:,chanj))')));

        end
    end
    t=toc;
    time(4,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC(chani,chanj,5)= abs(dot((complex_data_HB(:,chani))',(complex_data_HB(:,chanj))')/(norm((complex_data_HB(:,chani))')*norm((complex_data_HB(:,chanj))')));

        end
    end
    t=toc;
    time(4,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC(chani,chanj,6)= abs(dot((complex_data_GA(:,chani))',(complex_data_GA(:,chanj))')/(norm((complex_data_GA(:,chani))')*norm((complex_data_GA(:,chanj))')));

        end
    end
    t=toc;
    time(4,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxabsCC(chani,chanj,7)= abs(dot((mydata_complex(:,chani))',(mydata_complex(:,chanj))')/(norm((mydata_complex(:,chani))')*norm((mydata_complex(:,chanj))')));

        end
    end
    t=toc;
    time(4,7)=t;

%% imCPCC
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC(chani,chanj,1)= abs(imag(dot((complex_data_DE(:,chani))',(complex_data_DE(:,chanj))')/(norm((complex_data_DE(:,chani))')*norm((complex_data_DE(:,chanj))'))));

        end
    end
    t=toc;
    time(5,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC(chani,chanj,2)= abs(imag(dot((complex_data_TH(:,chani))',(complex_data_TH(:,chanj))')/(norm((complex_data_TH(:,chani))')*norm((complex_data_TH(:,chanj))'))));

        end
    end
    t=toc;
    time(5,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC(chani,chanj,3)= abs(imag(dot((complex_data_AL(:,chani))',(complex_data_AL(:,chanj))')/(norm((complex_data_AL(:,chani))')*norm((complex_data_AL(:,chanj))'))));

        end
    end
    t=toc;
    time(5,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC(chani,chanj,4)= abs(imag(dot((complex_data_LB(:,chani))',(complex_data_LB(:,chanj))')/(norm((complex_data_LB(:,chani))')*norm((complex_data_LB(:,chanj))'))));

        end
    end
    t=toc;
    time(5,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC(chani,chanj,5)= abs(imag(dot((complex_data_HB(:,chani))',(complex_data_HB(:,chanj))')/(norm((complex_data_HB(:,chani))')*norm((complex_data_HB(:,chanj))'))));

        end
    end
    t=toc;
    time(5,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC(chani,chanj,6)= abs(imag(dot((complex_data_GA(:,chani))',(complex_data_GA(:,chanj))')/(norm((complex_data_GA(:,chani))')*norm((complex_data_GA(:,chanj))'))));

        end
    end
    t=toc;
    time(5,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            ConnMxImagCC(chani,chanj,7)= abs(imag(dot((mydata_complex(:,chani))',(mydata_complex(:,chanj))')/(norm((mydata_complex(:,chani))')*norm((mydata_complex(:,chanj))'))));

        end
    end
    t=toc;
    time(5,7)=t;


    
    
%% absCPCC & imCPCC because of time calculation
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_DE(:,chani))',(complex_data_DE(:,chanj))')/(norm((complex_data_DE(:,chani))')*norm((complex_data_DE(:,chanj))'));
            ConnMxabsCC(chani,chanj,1)= abs(korelacija);
            ConnMxImagCC(chani,chanj,1)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(6,1)=t;
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_TH(:,chani))',(complex_data_TH(:,chanj))')/(norm((complex_data_TH(:,chani))')*norm((complex_data_TH(:,chanj))'));
            ConnMxabsCC(chani,chanj,2)= abs(korelacija);
            ConnMxImagCC(chani,chanj,2)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(6,2)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_AL(:,chani))',(complex_data_AL(:,chanj))')/(norm((complex_data_AL(:,chani))')*norm((complex_data_AL(:,chanj))'));
            ConnMxabsCC(chani,chanj,3)= abs(korelacija);
            ConnMxImagCC(chani,chanj,3)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(6,3)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_LB(:,chani))',(complex_data_LB(:,chanj))')/(norm((complex_data_LB(:,chani))')*norm((complex_data_LB(:,chanj))'));
            ConnMxabsCC(chani,chanj,4)= abs(korelacija);
            ConnMxImagCC(chani,chanj,4)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(6,4)=t;
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_HB(:,chani))',(complex_data_HB(:,chanj))')/(norm((complex_data_HB(:,chani))')*norm((complex_data_HB(:,chanj))'));
            ConnMxabsCC(chani,chanj,5)= abs(korelacija);
            ConnMxImagCC(chani,chanj,5)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(6,5)=t;
    
    
    
    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((complex_data_GA(:,chani))',(complex_data_GA(:,chanj))')/(norm((complex_data_GA(:,chani))')*norm((complex_data_GA(:,chanj))'));
            ConnMxabsCC(chani,chanj,6)= abs(korelacija);
            ConnMxImagCC(chani,chanj,6)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(6,6)=t;
    

    tic;
    for chani=1:nrE1
        for chanj=1:nrE1
            korelacija=dot((mydata_complex(:,chani))',(mydata_complex(:,chanj))')/(norm((mydata_complex(:,chani))')*norm((mydata_complex(:,chanj))'))
            ConnMxabsCC(chani,chanj,7)= abs(korelacija);
            ConnMxImagCC(chani,chanj,7)= abs(imag(korelacija));

        end
    end
    t=toc;
    time(6,7)=t;


   %% Save Workspace
% I suggest you save your data on your path so that you can research faster in the future (just one repeat this procedure is enough, 
% you do not have to recalculate it every time you want to use this data for your research).

% save('path/name') 


