%% Problem 0 (Textbook session 21)
fb = 50;
H = 0.5*[0.129 , 0.2161, 1.1926, 1.2281, 1.2062, 0.0045]; %(s)
stiffness = [16.0858, 29.1075, 43.365,  59.0483,  2.3517]; %(pu [torque]/[elec. rad])
torsional_analysis(fb,H,stiffness)

%% Problem 1 (Kundur Fig. 15.3) (a 555 MVA, 3,600 rpm steam turbine generator)
fb = 60;
H = [0.124 , 0.232, 1.155, 1.192, 0.855]; %(s)
stiffness = [21.8, 48.4, 75.6,  62.3,  1.98]; %(pu [torque]/[elec. rad])
torsional_analysis(fb,H,stiffness)

%% Problem 2 (Kundur Fig. 15.4)(a 960 MVA, 1,800 rpm turbine generator)
fb = 60;
H = [0.176 , 1.427, 1.428, 1.428, 0.869]; %(s)
stiffness = [17.78, 27.66, 31.31,  37.25]; %(pu [torque]/[elec. rad])
torsional_analysis(fb,H,stiffness)

%% Problem 3 (Kundur Fig. 15.5)(a 191 MVA, 3,600 rpm turbine generator)
fb = 60;
H = [0.099 , 0.337, 3.68, 0.946]; %(s)
stiffness = [37.95, 81.91, 82.74]; %(pu [torque]/[elec. rad])
torsional_analysis(fb,H,stiffness)

%% Problem 4 (Kundur Fig. 15.6)(a 635 MVA, 1,800 rpm turbine generator)
fb = 60;
H = [0.254 , 0.983, 1.001, 1.009, 1.035, 0.013]; %(s)
stiffness = [13.9, 18.2, 25.2, 54.9, 5.7]; %(pu [torque]/[elec. rad])
torsional_analysis(fb,H,stiffness)

%% Problem 5 ("First benchmark model for computersimulation of subsynchronous resonance,” IEEE Trans. Power Apparat.Syst., vol. 96, pp. 1565–1572, Sept.–Oct. 1977)(IEEE fisrt benchmark model)
fb=60;
H = [0.092897 0.155589 0.858670 0.884215 0.868495 0.0342165]; %(s)
stiffness = [19.303 34.929 52.038 70.858 2.82]; %(pu [torque]/[elec. rad])
torsional_analysis(fb,H,stiffness)
