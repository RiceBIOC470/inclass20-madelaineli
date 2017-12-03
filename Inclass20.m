%GB comments
1A 100
1B 100
1C 100
2. 100
Overall 100


%Inclass 20
%In this folder you will find a .mat file with x and y data
file = load('data.mat');
x = file.xx;
y = file.yy;
% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 
% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x).
fitstr = 'V*x/(K+x)';
fitmodel = fittype(fitstr);
[fit_out,fit_metric] = fit(x',y',fitmodel);
K_1=fit_out.K
V_1=fit_out.V
figure(1)
scatter(x,y)
hold on
plot(fit_out,x',y')
% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)
fitstr2 = 'V*x^2/(K^2+x^2)';
fitmodel2 = fittype(fitstr2);
[fit_out2,fit_metric2] = fit(x',y',fitmodel2);
K_2=fit_out2.K
V_2=fit_out2.V
figure(2)
scatter(x,y)
hold on
plot(fit_out2,x',y')
% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)
fitstr3 = 'V*x^n/(K^2+x^2)';
fitmodel3 = fittype(fitstr3);
[fit_out3,fit_metric3] = fit(x',y',fitmodel3,'Lower',[0, 0, 0]);
K_3=fit_out3.K
V_3=fit_out3.V
figure(3)
scatter(x,y)
hold on
plot(fit_out3,x',y')
% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.
fitmodel4 = fittype(fitstr3,'problem','n');
[fit_out4,fit_metric4] = fit(x',y',fitmodel4,'problem',1);
K_4=fit_out4.K
V_4=fit_out4.V
figure(4)
scatter(x,y)
hold on
plot(fit_out4,x',y')
[fit_out5,fit_metric5] = fit(x',y',fitmodel4,'problem',2);
K_5=fit_out5.K
V_5=fit_out5.V
figure(5)
scatter(x,y)
hold on
plot(fit_out5,x',y')
