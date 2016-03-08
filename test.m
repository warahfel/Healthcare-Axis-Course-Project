

% Imports the data on health workforce density by country and year per 1000
Workforce = readtable('Pdata.csv');%%changed to WF rather than T
WF= table2cell(Workforce);


years=cell2mat(WF(:,2));
x2001=find(years==2001);
x2005=find(years==2005);
x2009=find(years==2009);
x2013=find(years==2013);

dp1=cell2mat(WF(x2001,3));
dp5=cell2mat(WF(x2005,3));
dp9=cell2mat(WF(x2009,3));
dp13=cell2mat(WF(x2013,3));


nbins = 1:.5:8;
figure;
hist(dp1,nbins)
hold on
hist(dp5,nbins)
hist(dp9,nbins)
hist(dp13,nbins)

legend('2001','2005','2009','2013')
title('Density of Physcians by Year')
ylabel('Number of Countries')
xlabel('Density of Physicians per 1000')





%%%%HIV Prevalence

HIV = readtable('HIV.xls');
H=table2cell(HIV);
Hall=H(2:117,2:5);%%Values of 1st 50 countries in list
Hall=str2double(Hall);

figure;
hist(Hall)
legend ('2013','2009','2005','2001')
title 'HIV Prevalence'
xlabel 'Prevalence'
ylabel 'Number of Countries'



