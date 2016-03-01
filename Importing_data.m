
% Imports the data on health workforce numbers by country and year
WF = readtable('health_workforce.xls');%%changed to WF rather than T

% Imports the data on health workforce numbers by country and year
T = readtable('xmart.csv')


x= cell2mat(T{:,1});
y=cell2mat(T{:,2:15});
figure
plot(x,y)


