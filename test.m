

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
%%
dp=[dp1',dp5',dp9',dp13'];%%%%make a matrix with all the data points and years then histogram
hist(dp)%hist of all the data 

nbins = 1:.5:8;
figure;
[n1,x1]=hist(dp1,nbins)

[n2,x2]=hist(dp5,nbins)
[n3,x3]=hist(dp9,nbins)
[n4,x4]=hist(dp13,nbins)

h1=bar(x1,n1,'hist')
hold on
h2=bar(x2,x2,'hist')
h3=bar(x3,n3,'hist')
h4=bar(x4,n4,'hist')


set(h2,'facecolor','red')
set(h3,'facecolor','green')
set(h4,'facecolor','yellow')

legend('2001','2005','2009','2013')
title('Density of Physcians by Year')
ylabel('Number of Countries')
xlabel('Density of Physicians per 1000')


%%code from http://www.mathworks.com/matlabcentral/answers/101869-can-hist-take-parameters-such-as-facecolor-and-edgecolor

%%%Plot unsure about axes
plot(dp1,'.')
hold on
plot(dp5,'o')
plot(dp9,'x')
plot(dp13,'+')


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



