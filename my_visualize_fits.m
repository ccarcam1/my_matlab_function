function keep_these_struct = my_visualize_fits(start_var, end_var, pre_MSD)
% end variable would be length(gaussfit)
for i = start_var:end_var
    figure;
    yyaxis left
    plot(pre_MSD(i).timepix, pre_MSD(i).intensity)
    ylabel('intensity, a.u.');
    yyaxis right
    plot(pre_MSD(i).timepix, pre_MSD(i).pixel)
    set(gcf,'Position',[0.3333,   41.6667,  479.0000,  293.6667]);
    title(pre_MSD(i).name, 'Interpreter', 'none');
    xlabel('time, s');
    ylabel('pixel peak position');

    figure;
    set(gcf,'Position',[482.0000,   31.0000,  472.6667,  615.6667]);
    imagesc(pre_MSD(i).full_kymo);
    hold on
    ksize = size(pre_MSD(i).full_kymo);
    kw=ksize(:,2);
    kh=ksize(:,1);
    
    rectangle('Position',[pre_MSD(i).crop_coordinates(3),pre_MSD(i).crop_coordinates(1),...
        pre_MSD(i).crop_coordinates(4)-pre_MSD(i).crop_coordinates(3),pre_MSD(i).crop_coordinates(2)-...
        pre_MSD(i).crop_coordinates(1)], 'EdgeColor','y'); 
    hold off
    
    figure;
    set(gcf,'Position',[958.3333,   36.6667,  316.3333,  608.6667]);
    title(pre_MSD(i).name);
    s1=subplot(1,3,1);imagesc(pre_MSD(i).crop),colormap(gray);
    title('kymograph');
    xlabel('x, px');
    ylabel('y, px');
    s2=subplot(1,3,2);imagesc(pre_MSD(i).crop),colormap(gray);
    hold on
    plot(s2,pre_MSD(i).pixel,pre_MSD(i).timepix,'-y');
    title('overlay');
    xlabel('x, px');
    ylabel('y, px');
    hold off
    s3=subplot(1,3,3);
    plot(s3,pre_MSD(i).pixel,pre_MSD(i).timepix,'ro');
    s3=gca;
%     xlim(gca,[0 w]);
%     ylim(gca,[0 t]);
    set(gca,'YDir','Reverse');
    title('trace');
    xlabel('x, px');
    ylabel('y, px');

    choice = menu('Choose an action','Good Fit','Bad Fit', 'Break');
disp(['you are on trace ', num2str(start_var), ' out of ', num2str(end_var)]);
if choice == 1
    keep_these_struct(i).name = pre_MSD(i).name;
    keep_these_struct(i).particle_tracked = horzcat(pre_MSD(i).timepix',pre_MSD(i).pixel',pre_MSD(i).intensity');
    keep_these_struct(i).crop_coordinates = pre_MSD(i).crop_coordinates;
    keep_these_struct(i).crop = pre_MSD(i).crop;
    keep_these_struct(i).line_time = pre_MSD(i).line_time;
    keep_these_struct(i).kymograph = pre_MSD(i).full_kymo;
elseif choice == 3
    break
close all    
end
end
end