clc 

%Inputs
% l = input('Input the length in mm = ');
% D = input('Input the Diameter in mm = ');
% d = input('Input the Diameter (2) in mm = ');
% w = input('Input the Weigth in gm = ');
% M = input('Input the Grades = ');
% P = input('Input the Load in Newton = ');

%Constants
g = 9.81;
Pi = 3.14;
Es = 210000;

l = 678.4;
D = 48.3;
d = 41.9;
W = 4136;
M = 20;
P = 134000;
n = 1;

%outputs

%Area
A = (Pi*D^2)/4;

%Mass
m = W/g;
fprintf('\n The value of Mass                             | m   = %f (N)\n', m);

%Moment of Inertia
Is = (Pi*(D^4 - d^4))/64;
% 
Ic = (Pi*(d^4))/64;

I = Is + Ic;
fprintf(' The Moment of Inertia                         | I   = %f (mm^4)\n', I);

%Radius of Gyration
rm = sqrt(I/A);

%Slenderness ratio
le = 0.65*l;
sr = le/rm;
fprintf(' The Slenderness ratio                         | sr  = %f \n', sr);

% The (EI)eff = Es Is + C3 Ec Ic (Nmm2)				
As = (Pi*(D^2 - d^2))/4;
Ac = (Pi*(d^2))/4;
C3 = 0.6+2*(As/(Ac+As));
Ec = 5000 * sqrt(M);

EI = (Es*Is)+(0.9*Ec*Ic); 				
fprintf(' The Effective Stiffness (EI)eff               | EI  = %f (Nmm^2)\n', EI);


% % % % % % % % % % % % % % % % % % % % % % % % % % 

fprintf('\n--------------------');
fprintf(' \nFOR BOTH END FIXED : \n');
fprintf('--------------------\n');

% Effective Length (mm)
le = 0.65*l;
fprintf(' The Effective Length                          | Le  = %f (mm)\n', le);

%load
Pcr = ((n^2)*((Pi)^2)*EI)/(le^2);
fprintf(' Critical Buckling Compressive Load Pcr        | Pcr = %f (N)\n', Pcr);

% Stiffnes (N/mm)
k = (12 * EI)/(le^3);
fprintf(' The Stiffnes                                  | k   = %f (N/mm)\n', k);

% Natural Frequency (rad)
w = sqrt(k/m);
fprintf(' The Natural Frequency                         | w   = %f (rad)\n', w);

% Frequency (Hz)
f = w/(2*Pi);
fprintf(' The Frequency                                 | f   = %f (Hz)\n', f);

% Time Period (sec)
t = 1/f;
fprintf(' The Time Period                               | t   = %f (sec)\n', t);

% For Effective density of Composite Material
rho = ((78000000)*(((Pi*(D^2 - d^2))*l)/4)) + ((24000000)*((Pi*d^2*l)/4));
fprintf(' The Effective density of Composite Material   | rho = %f (N/mm^3)\n', rho);

% For Column Vibration	
Cv1 = sqrt((sqrt(P^2+(4*rho*((Pi*D^2)/4)*EI*w^2)) + P)/(2*EI));
fprintf(' Column Vibration 1                            | Cv1 = %f \n', Cv1);

Cv2 = sqrt((sqrt(P^2+(4*rho*((Pi*D^2)/4)*EI*w^2)) + (-P))/(2*EI));
fprintf(' Column Vibration 2                            | Cv2 = %f \n', Cv2);

% For Column Buckling
Cb = sqrt(P/EI);
fprintf(' For Column Buckling                           | Cb  = %f \n', Cb);

% % % % % % % % % % % % % % % % % % % % % % % % % % % 
fprintf('\n----------------------------------');
fprintf(' \nFOR ONE END FIXED, ONE END HINGED : \n');
fprintf('----------------------------------\n');

%outputs

% Effective Length (mm)
le = l;
fprintf(' The Effective Length                          | Le  = %f (mm)\n', le);

%load
Pcr = ((n^2)*((Pi)^2)*EI)/(le^2);
fprintf(' Critical Buckling Compressive Load Pcr        | Pcr = %f (N)\n', Pcr);

% Stiffnes (N/mm)
k = (3 * EI)/(le^3);
fprintf(' The Stiffnes                                  | k   = %f (N/mm)\n', k);

% Natural Frequency (rad)
w = sqrt(k/m);
fprintf(' The Natural Frequency                         | w   = %f (rad)\n', w);

% Frequency (Hz)
f = w/(2*Pi);
fprintf(' The Frequency                                 | f   = %f (Hz)\n', f);

% Time Period (sec)
t = 1/f;
fprintf(' The Time Period                               | t   = %f (sec)\n', t);

% For Effective density of Composite Material
rho = ((78000000)*(((Pi*(D^2 - d^2))*l)/4)) + ((24000000)*((Pi*d^2*l)/4));
fprintf(' The Effective density of Composite Material   | rho = %f (N/mm^3)\n', rho);

% For Column Vibration	
Cv1 = sqrt((sqrt(P^2+(4*rho*((Pi*D^2)/4)*EI*w^2)) + P)/(2*EI));
fprintf(' Column Vibration 1                            | Cv1 = %f \n', Cv1);

Cv2 = sqrt((sqrt(P^2+(4*rho*((Pi*D^2)/4)*EI*w^2)) + (-P))/(2*EI));
fprintf(' Column Vibration 2                            | Cv2 = %f \n', Cv2);

% For Column Buckling
Cb = sqrt(P/EI);
fprintf(' For Column Buckling                           | Cb  = %f \n', Cb);
