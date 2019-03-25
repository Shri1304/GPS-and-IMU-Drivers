% run panaroma.m

figure

for i= 1:numImages
latino=[0,0,1]*tforms(i).T;
xlat(i)=latino(1);
ylat(i)=latino(2);
hold on;
end
plot(xlat,ylat,'r')
