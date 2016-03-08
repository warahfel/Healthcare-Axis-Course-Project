% Imports the data on health workforce numbers by country and year
WF = readtable('health_workforce.xls');%%changed to WF rather than T

% Imports the data on health workforce numbers by country and year
T = readtable('xmart.csv')
M = table2array(T)


x= cell2mat(T{:,1});
y=cell2mat(T{:,2:15});
figure
plot(x,y)
%%%%HIV Prevalence

x=M(:,1)
y=M(:,2:15)
scatter(x,y)
HIV = readtable('HIV.xls');
H=table2cell(HIV);
H50=H(2:49,2:5);%%Values of 1st 50 countries in list
H50=str2double(H50);

%%%%HIV Prevalence
figure;
hist(H50)
legend ('2013','2009','2005','2001')
title 'HIV Prevalence'
xlabel 'Prevalence'
ylabel 'Number of Countries'

HIV = readtable('HIV.xls')
H =table2array(HIV)


[coeffPC, scorePC, latentPC] = pca(H)
pv = 100*latentPC/sum(latentPC)
y = zeros(1,159);
for i = 1:159
    a = sum(pv(1:i)) ;
    y(i) = a;
end
figure;
x=1:159;
plot(x,y); 
