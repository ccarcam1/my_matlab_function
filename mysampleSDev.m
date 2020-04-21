% function sampleSDev  = mysampleSDev(MSD_data)

% for i = 1:length(MSD_data)
%     for j = 1:length(MSD_data(i).MSD)
%        a{j}=MSDss(i).r_all((MSDss(i).r_all(:,1) == j),:);
%     end
% end
% sampleSDev = a;

for i = 1:length(MSDss)
    sampleSDev = [];
    for j = 1:length(MSDss(i).breakdown)
        sampleSDev(j) = sqrt(sum((MSDss(i).breakdown{j}(:,2)- MSDss(i).MSD(j,2)).^2)/(length(MSDss(i).breakdown{j})-1));
    end
    MSDss(i).sampleSDev = sampleSDev;
    disp(i)
end
% end
       