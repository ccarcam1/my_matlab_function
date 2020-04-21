function cutoff = myCutOffFinder(MSDs)
for k = 1:length(MSDs)
    disp(k)
    for i = 3:(length(MSDs(k).coords)-1)   
        x = MSDs(k).MSD(1:i, 1);
        y = MSDs(k).MSD(1:i, 2);
        mdl = fitlm(x,y);
        rsquared(i) = mdl.Rsquared.Ordinary;
        pvalue(i) = mdl.Coefficients.pValue(2);
    end
    for i = 2:length(rsquared)-5
        a = rsquared(i+1)-rsquared(i);
        aa = rsquared(i)-rsquared(i-1);
        if a<0 && pvalue(i)<0.01 && aa>0
            b = rsquared(i+2)-rsquared(i+1);
            c = rsquared(i+3)-rsquared(i+2);
            d = rsquared(i+4)-rsquared(i+3);
            e = rsquared(i+5)-rsquared(i+4);
            if b<0 && c<0 && d<0 && e<0
                cutoff(k).fit_cutoff = i-1;
                break
            else
            end
        else
        cutoff(k).fit_cutoff = NaN;
        end
    end
end
end




% for k = 1:20 %length(mydata)
% MSD = MSDss(k).MSD;
% record_this = zeros(size(mydata(k).coords, 1)-1);
% record_that = zeros(size(mydata(k).coords, 1)-1);
% cuthere = round(length(mydata(k).coords)/4);
%     for i = 3: cuthere %size(mydata(k).coords, 1)-1
%     x = MSD(1:i, 1);
%     y = MSD(1:i, 2);
%     mdl = fitlm(x,y);
%     record_this(i) = mdl.Rsquared.Ordinary;
%     record_that(i) = mdl.Coefficients.pValue(2);
%     end
% holdthis(k).rsquared = record_this;
% holdthis(k).pvalue = record_that;
% disp(k)
% end
% 
% for k = 1:20%length(mydata)
% %     x = 1;
%     r2_list = (holdthis(k).rsquared);
%     for i = 2:length(r2_list)-5
%         a = r2_list(i+1)-r2_list(i);
%         aa = r2_list(i)-r2_list(i-1);
%         if a<0 && holdthis(k).pvalue(i)<0.01 && aa>0
%             b = r2_list(i+2)-r2_list(i+1);
%             c = r2_list(i+3)-r2_list(i+2);
%             d = r2_list(i+4)-r2_list(i+3);
%             e = r2_list(i+5)-r2_list(i+4);
%             if b<0 && c<0 && d<0 && e<0
%                 cutoff(k).fit_cutoff = i-1;
%                 break
%             else
%             end
%         else
%         cutoff(k).fit_cutoff = NaN;
%         end
%     end
% end



