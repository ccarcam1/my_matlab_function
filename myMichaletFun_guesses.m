function [epsilon_val, alpha_val]  = myMichaletFun_guesses(MSD_data)
% plot(MSDss(1).MSD(:,1),(MSDss(1).MSD(:,2)))
for i = 1%:length(MSD_data)
%     end_point = round(length(MSD_data(i))/4);
    cutoff = myCutOffFindersigleparticle(MSD_data(i).MSD(:,1), MSD_data(i).MSD(:,2));
    x = MSD_data(i).MSD(1:cutoff,1);
    y =  MSD_data(i).MSD(1:cutoff,2);
    mdl = fitlm(x,y);
    alpha_val(i) = mdl.Coefficients.Estimate(2)*(MSD_data(i).timestep/1000);
    epsilon_val(i) = mdl.Coefficients.Estimate(1);
end
end
