% Imports the data physician density and 
data = readtable('hepB.physician.density.by.year.csv');
D= table2cell(data);

%%
% vectors for hepB immunization rates in percentage of 1 year olds
% immunized
hepB2013 = cell2mat(D(1:28,1));
hepB2012 = cell2mat(D(1:46,3));
hepB2011 = cell2mat(D(1:50,5));
hepB2010 = cell2mat(D(1:78,7));
hepB2009 = cell2mat(D(1:90,9));
hepB2008 = cell2mat(D(1:81,11));
hepB2007 = cell2mat(D(1:56,13));
hepB2006 = cell2mat(D(1:42,15));
hepB2005 = cell2mat(D(1:45,17));
hepB2004 = cell2mat(D(1:60,19));

%%
% corresponding vectors for physician density in physicians per 1000

pd2013 = cell2mat(D(1:28,2));
pd2012 = cell2mat(D(1:46,4));
pd2011 = cell2mat(D(1:50,6));
pd2010 = cell2mat(D(1:78,8));
pd2009 = cell2mat(D(1:90,10));
pd2008 = cell2mat(D(1:81,12));
pd2007 = cell2mat(D(1:56,14));
pd2006 = cell2mat(D(1:42,16));
pd2005 = cell2mat(D(1:45,18));
pd2004 = cell2mat(D(1:60,20));

%%
% combining the vectors to form a scatter plot
hepB2013to2004 = [hepB2013; hepB2012; hepB2011; hepB2010; hepB2009; hepB2008; hepB2007; hepB2006; hepB2005; hepB2004];
pd2013to2004 = [pd2013; pd2012; pd2011; pd2010; pd2009; pd2008; pd2007; pd2006; pd2005; pd2004];

%%


% linear regression line using polyfit

x = pd2013to2004;
y = hepB2013to2004;
[p,S,mu] = polyfit(x,y,1);
x1 = 0:0.01:8;
y1 = polyval(p,x1);

% Scatter plot
scatter(x,y)
hold on
plot(x1,y1)
title('Physician Density vs. Hepatitis B immunizations for 2004-2013')
xlabel('Physician Density (physicians per 1000)')
ylabel('1 Year Olds Immunized (%)')
ylim([60 100]);

% Table that shows the fit and error of fit at each point for the line
f = polyval(p,x);
T = table(x,y,f,y-f,'VariableNames',{'X','Y','Fit','FitError'});
% correlation coefficients and P values
A = [x y];
[R, P] = corrcoef(A);
R
P