

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
nbins = 1:.5:8
%hist of all the data 

figure
hist(dp1,nbins)
title('Density of Physcians in 2001')
ylabel('Number of Countries')
xlabel('Density of Physicians per 1000')


figure
hist(dp5,nbins)
title('Density of Physcians in 2005')
ylabel('Number of Countries')
xlabel('Density of Physicians per 1000')
figure;


figure
hist(dp9,nbins)
title('Density of Physcians in 2009')
ylabel('Number of Countries')
xlabel('Density of Physicians per 1000')
figure;

figure
hist(dp13,nbins)
title('Density of Physicians in 2013')
ylabel('Number of Countries')
xlabel('Density of Physicians per 1000')





%%%Plot 
figure;
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
Hall=H(3:117,2:5);%%Values of 1st 50 countries in list
Hall=str2double(Hall);

figure;
nbins = 1:.5:8;
hist(Hall,nbins)
legend ('2013','2009','2005','2001')
title 'HIV Prevalence'
xlabel 'Prevalence'
ylabel 'Number of Countries'



%%%%% Workforce vs Prevalence

%Scatter Plot
WF1= WF(x2001,1);%country names for workforce 2001
WF5=WF(x2005,1);
WF9=WF(x2009,1);
WF13=WF(x2013,1);

h1=([.1,.1,.8,.6,27.7,.1,.1,.4,.4,.1,.6,.5,.1,25.5,.3,1.8,1.4,.1,.6,.3]' / 10);
h5=([0.1, 0.1, 0.8, 25.4, 5.1, 5.2, 0.3, 0.5, 0.1, 2.4, 0.1, 0.6, 2.6, 1.3, 1.5, 0.9, 0.4, 0.1, 0.1 0.2, 0.8, 0.1, 3.8, 0.1, 0.6, 0.5, 0.1, 0.3, 0.1, 6.2, 0.4, 13.7]' / 10);
h9=([0.1,2.0,0.1, 0.1,  0.1,0.3,1.6,23.6, 0.5, 0.9,4.8,4.9,0.3, 0.5,0.1, 0.1,0.2,0.4,  0.1, 1.6,0.1, 0.2,1.6, 0.6,3.9,1.,0.3, 0.3,6.,0.2,0.1,12.5,0.1, 1.1,0.2,0.1,0.1,0.7,0.2, 3.6, 0.1, 0.6,0.4,3.1, 0.1,0.4,0.1,26.8, 1.2,0.1,0.1, 0.2, 0.4, 0.1,13.2,16.5,0.1]' / 10);
h13=([0.1, 0.2, 0.2, 0.5, 0.2, 0.3, 6.0, 0.2, 0.2, 0.6, 0.6, 19.1, 0.4, 0.3, 0.8, 0.3, 0.2, 0.4]' /10);
    
    


scatter(dp1,h1,'filled')
hold on
scatter(dp5,h5,'filled')
scatter(dp9,h9,'filled')
l1=(h9'/dp9')%%%most data
y1=(dp9 *l1)
plot(dp9,-y1)
scatter(dp13,h13,'filled')
xlabel('Physician Density per 1000')
ylabel('HIV Prevalence per 1000')
title('Physician vs HIV Prevalence')


%%%%%Prevalence of MD by country by Year


  
display(mean(dp1))
display(mean(dp5))
display(mean(dp9))
display(mean(dp13))




