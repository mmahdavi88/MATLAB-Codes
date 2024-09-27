%Biomass Potencial of Morocco and Brazil for Energy and Electricity Generation 
%Input data
TableA.I=[21	600;15	2100;55	6000;61	6800;62	2100;119    10800;129	6800;377	500;1200	6000;5329	2500];
TableA.II=[0.375	0.8;0.45	0.45;0.75	0.15;0.1	0.6;0.22	0.6;0.85	0.8;0.375	0.8;0.1	0.375;0.4	0.5;0.15	0.375];
TableA.III=100*[0.0127	0.3938	0.0548;0.0118	0.5146	0.0588;0.0099	0.4208	0.0632;0.0082	0.459	0.0579;0.0038	0.4533	0.0591;0.0164	0.4201	0.0645;0.0031	0.4534	0.0885;0.012	0.4202	0.0643;0.0147	0.4536	0.0547;0.0143	0.4811	0.0629];
TableV=[200;8450 ;1050;0;63;701.2;930.6;2800;20;27000]; %CULTIVATED AREA OF AGRICULTURAL PRODUCTS IN BRAZIL (kha)
%Data extraction
C=[TableA.III(:,2)]; %Carbon content (%)
H=[TableA.III(:,3)]; %Hydrogen content (%)
N=[TableA.III(:,1)]; %Nitrogen content (%)
a=[TableA.II(:,1)]; %Moisture content
A=[TableA.I(:,1)]; %Cultivated Area in Morocco (kha)
Y=[TableA.I(:,2)]; %Biomass Yield (kg/ha)
Av=[TableA.II(:,2)];
%Calculations for Morocco
HHV=(3550*C.^2)-(232000*C)-(2230000*H)+(51200*C.*H)+(131000*N)+20600000; %kJ/t
LHV=((1-a).*HHV)-(2443000*a); %kJ/t
M1=Y.*A; %Mass of dry agricultural residues in Morocco (t)
M2=Y.*TableV; %Mass of dry agricultural residues in Brazil (t)
T_peak1=1000*M1.*HHV; %PEAK PROSPECTIVE ENERGY PRODUCTION FROM VARIOUS RESIDUES IN MOROCCO (J)
T_least1=1000*M1.*LHV; %LEAST PROSPECTIVE ENERGY PRODUCTION FROM VARIOUS RESIDUES IN MOROCCO (J)
H_peak1=T_peak1.*Av; %PEAK REAL POWER PRODUCTION FROM RESIDUES IN MOROCCO(J)
H_least1=T_least1.*Av; %LEAST REAL POWER PRODUCTION FROM RESIDUES IN MOROCCO(J)
E_peak1=H_peak1./3600; %PEAK ELECTRIC POWER GENERATED VIA RESIDUES IN MOROCCO (Wh)
E_least1=H_least1./3600; %LEAST ELECTRIC POWER GENERATED VIA RESIDUES IN MOROCCO (Wh)
E1=10^-12.*[E_least1,E_peak1]; %(TWh)
%Calculations for Brazil
T_peak2=1000*M2.*HHV; %PEAK PROSPECTIVE ENERGY PRODUCTION FROM VARIOUS RESIDUES IN BRAZIL (J)
T_least2=1000*M2.*LHV; %LEAST PROSPECTIVE ENERGY PRODUCTION FROM VARIOUS RESIDUES IN BRAZIL (J)
H_peak2=T_peak2.*Av; %PEAK REAL POWER PRODUCTION FROM RESIDUES IN BRAZIL (J)
H_least2=T_least2.*Av; %LEAST REAL POWER PRODUCTION FROM RESIDUES IN BRAZIL (J)
E_peak2=H_peak2./3600; %PEAK ELECTRIC POWER GENERATED VIA RESIDUES IN BRAZIL (Wh)
E_least2=H_least2./3600; %LEAST ELECTRIC POWER GENERATED VIA RESIDUES IN BRAZIL (Wh)
E2=10^-12.*[E_least2,E_peak2]; %(TWh)
%--------------------------------------------------------------------------------------------
disp('Table IV: Electric Power Generated via Residues in Morocco (TWh)');
disp('___________________________________________________');
waste1 = {
    'Peanut', E1(1,1), E1(1,2);
    'Sugarcane bagasse', E1(2,1), E1(2,2);
    'Sugar beet leaves', E1(3,1), E1(3,2);
    'Date palm', E1(4,1), E1(4,2);
    'Sunflower stems/leaves', E1(5,1), E1(5,2);
    'Market gardening pruning', E1(6,1), E1(6,2);
    'Citrus pruning', E1(7,1), E1(7,2);
    'Legume stems/straws', E1(8,1), E1(8,2);
    'Olive pruning', E1(9,1), E1(9,2);
    'Cereal straws', E1(10,1), E1(10,2)
};

% Display Header
fprintf('%-30s %12s %18s\n', 'Waste', 'Least', 'Peak');
fprintf('------------------------------------------------------------------------\n');

% Display Data
for i = 1:size(waste1, 1)
    fprintf('%-30s %14f %15.4f\n', waste1{i, 1}, waste1{i, 2}, waste1{i, 3});
end
disp('___________________________________________________');


disp('Table IX: Electric Power Generated via Residues in Brazil (TWh)');
disp('___________________________________________________');
waste2 = {
    'Peanut', E2(1,1), E2(1,2);
    'Sugarcane bagasse', E2(2,1), E2(2,2);
    'Sugar beet leaves', E2(3,1), E2(3,2);
    'Date palm', E2(4,1), E2(4,2);
    'Sunflower stems/leaves', E2(5,1), E2(5,2);
    'Market gardening pruning', E2(6,1), E2(6,2);
    'Citrus pruning', E2(7,1), E2(7,2);
    'Legume stems/straws', E2(8,1), E2(8,2);
    'Olive pruning', E2(9,1), E2(9,2);
    'Cereal straws', E2(10,1), E2(10,2)
};

% Display Header
fprintf('%-30s %12s %18s\n', 'Waste', 'Least', 'Peak');
fprintf('------------------------------------------------------------------------\n');

% Display Data
for i = 1:size(waste2, 1)
    fprintf('%-30s %14f %15.4f\n', waste2{i, 1}, waste2{i, 2}, waste2{i, 3});
end
disp('___________________________________________________');