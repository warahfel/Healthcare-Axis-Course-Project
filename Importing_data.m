
% Imports the data on health workforce numbers by country and year
WF = readtable('health_workforce.xls');%%changed to WF rather than T

% Imports the data on health workforce numbers by country and year
T = readtable('xmart.csv')
M = table2array(T)


x= cell2mat(T{:,1});
y=cell2mat(T{:,2:15});
figure
plot(x,y)

x=M(:,1)
y=M(:,2:15)
scatter(x,y)

%%%%HIV Prevalence

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
plot(x,y);