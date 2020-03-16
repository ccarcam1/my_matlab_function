function keep_these_structure = my_visualize_fits(start_var, end_var, pre_MSD)
% end variable would be length(gaussfit)
for i = start_var:end_var
    figure;
    yyaxis left
    plot(pre_MSD(i).timepix, pre_MSD(i).intensity)
    ylabel('intensity, a.u.');
    yyaxis right
    plot(pre_MSD(i).timepix, pre_MSD(i).pixel)
    set(gcf,'Position',[0.3333,   41.6667,  479.0000,  293.6667]);
    title(pre_MSD(i).name);
    xlabel('time, s');
    ylabel('pixel peak position');
end
%     figure;
%     set(gcf,'Position',[482.0000,   31.0000,  472.6667,  615.6667]);
%     imagesc(kymograph);
%     hold on
%     ksize = size(kymograph);
%     kw=ksize(:,2);
%     kh=ksize(:,1);
%     
%     rectangle('Position',[crop_coordinates(3),crop_coordinates(1),...
%         crop_coordinates(4)-crop_coordinates(3),crop_coordinates(2)-...
%         crop_coordinates(1)], 'EdgeColor','y'); 
%     hold off
%     
%     figure;
%     set(gcf,'Position',[958.3333,   36.6667,  316.3333,  608.6667]);
%     title(filename);
%     s1=subplot(1,3,1);imagesc(crop),colormap(gray);
%     title('kymograph');
%     xlabel('x, px');
%     ylabel('y, px');
%     s2=subplot(1,3,2);imagesc(crop),colormap(gray);
%     hold on
%     plot(s2,pixel,timepix,'-y');
%     title('overlay');
%      xlabel('x, px');
%     ylabel('y, px');
%     hold off
%     s3=subplot(1,3,3);
%     plot(s3,pixel,timepix,'ro');
%     s3=gca;
%     xlim(gca,[0 w]);
%     ylim(gca,[0 t]);
%     set(gca,'YDir','Reverse');
%     title('trace');
%     xlabel('x, px');
%     ylabel('y, px');
%     out=horzcat(time,position,intensity,int);
% 
%     choice = menu('Choose an action','Good Fit','Could-be-better Fit',...
%     'multiple molecules', 'Not going to fit, likely', 'Break');
% disp(['you are on trace ', num2str(which3), ' out of ', num2str(length(file_name_2))]);
% if choice == 1
%     keep_these{1,which3} = filename;
%     keep_these{2,which3} = out;
%     keep_these{3,which3} = crop_coordinates;
%     keep_these{4,which3} = crop;
%     keep_these{5,which3} = timestep;
%     keep_these{6,which3} = kymograph;
% elseif choice == 2
%     could_be_better{1,which3} = filename;