function my_visualize_fits2(start_var, end_var, pre_MSD)
for i = start_var:end_var
    filename = pre_MSD(i).name;
    timestep = pre_MSD(i).line_time;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     int=abs(height.*width);
%     int=transpose(int);
    intensity = transpose(pre_MSD(i).intensity);
    time= pre_MSD(i).timepix*timestep;
    time=transpose(time);
    position= pre_MSD(i).pixel.*0.1;
    position=transpose(position);
    % plot coordinates (blue) and brightness (green) vs time
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(1);
    yyaxis left
    plot(time, position)
    ylabel('position, \mum');
    yyaxis right
    plot(time, intensity)
%     set(gcf,'Position',[0,75,700,500]);% for work computer
    set(gcf,'Position',[0,25,400,300]);% for laptop
    title(filename);
    xlabel('time, s');
    ylabel('intensity, a.u.');
    % displays the original cropped image side by side with the traced
    % coordinates
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(2);
%     set(gcf,'Position',[650,50,700,1100]); %for work computer
    set(gcf,'Position',[375,25,500,600]);% for laptop
    imagesc(rot90(pre_MSD(i).full_kymo,3));
    hold on
%     ksize = size(pre_MSD(i).full_kymo);
%     kw=ksize(:,2);
%     kh=ksize(:,1);
    
    rectangle('Position',[pre_MSD(i).crop_coordinates(3),pre_MSD(i).crop_coordinates(1),...
        pre_MSD(i).crop_coordinates(4)-pre_MSD(i).crop_coordinates(3),pre_MSD(i).crop_coordinates(2)-...
        pre_MSD(i).crop_coordinates(1)], 'EdgeColor','y'); 
    hold off
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure;
%     set(gcf,'Position',[1350,50,700,1100]); % for work computer
    set(gcf,'Position',[825,25,450,600]); % for laptop
    title(filename);
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
    sz=size(pre_MSD(i).crop);
    t=sz(:,1);
    w=sz(:,2);
    xlim(gca,[0 w]);
    ylim(gca,[0 t]);
    set(gca,'YDir','Reverse');
    title('trace');
    xlabel('x, px');
    ylabel('y, px');
%     out=horzcat(time,position,intensity,int);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %     choose if you want to save or discard the fitted coordinates
% choice = menu('Choose an action','Good Fit','Could-be-better Fit',...
%     'multiple molecules', 'Not going to fit, likely', 'Break');
% disp(['you are on trace ', num2str(i), ' out of ', num2str(length(file_name_2))]);
% if choice == 1
%     keep_these{1,i} = filename;
%     keep_these{2,i} = out;
%     keep_these{3,i} = crop_coordinates;
%     keep_these{4,i} = crop;
%     keep_these{5,i} = timestep;
%     keep_these{6,i} = kymograph;
% elseif choice == 2
%     could_be_better{1,i} = filename;
%     could_be_better{2,i} = out;
%     could_be_better{3,i} = crop_coordinates;
%     could_be_better{4,i} = crop;
%     could_be_better{5,i} = timestep;
% elseif choice == 3
%     multiple_molecules{1,i} = filename;
%     multiple_molecules{2,i} = out;
%     multiple_molecules{3,i} = crop_coordinates;
%     multiple_molecules{4,i} = crop;
%     multiple_molecules{5,i} = timestep;
% elseif choice == 4
%     not_gonna_fit{1,i} = filename;
%     not_gonna_fit{2,i} = out;
%     not_gonna_fit{3,i} = crop_coordinates;
%     not_gonna_fit{4,i} = crop;
%     not_gonna_fit{5,i} = timestep;
% else
%     break
% end
% close all
% 
%    
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cd(final_results);
% save('keep_these', 'keep_these');
% save('not_gonna_fit', 'not_gonna_fit');
% save('could_be_better','could_be_better');
% save( 'multiple_molecules', 'multiple_molecules');
% close all;

end