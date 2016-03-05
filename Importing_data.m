
% Imports the data on health workforce numbers by country and year
WF = readtable('health_workforce.xls');%%changed to WF rather than T



%%%%HIV Prevalence

HIV = readtable('HIV.xls');
H=table2cell(HIV);
H50=H(2:49,2:5);%%Values of 1st 50 countries in list
H50=str2double(H50);

figure;
hist(H50)
legend ('2013','2009','2005','2001')
title 'HIV Prevalence'
xlabel 'Prevalence'
ylabel 'Number of Countries'



