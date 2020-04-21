function MSDss = myAllDispFun(MSDss)
for i = 1:length(MSDss)
    a = cell([1 length(MSDss(i).MSD)]);
    for j = 1:length(MSDss(i).MSD)
       a{j}=MSDss(i).r_all((MSDss(i).r_all(:,1) == j),:);
    end
    MSDss(i).breakdown = a;
    disp(['cell = ', num2str(i)])
end
end