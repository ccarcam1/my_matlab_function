
function structure_name = my_segment_kymos(start_var, end_var, which_color)
mat = dir('*.mat');
for q = 1:length(mat)
    load(mat(q).name);
end

data2 = data([start_var:end_var]);
for i = 1:length([start_var:end_var])
    if contains(which_color, 'red')
        data3(i).name = data2(i).name;
        data3(i).color = data2(i).red_kymo;
        data3(i).line_time = data2(i).line_time;
    elseif contains(which_color, 'green')
        data3(i).name = data2(i).name;
        data3(i).color = data2(i).green_kymo;
        data3(i).line_time = data2(i).line_time;
    end
end
counter = 1;
for i = 1:length(data3)
    kymograph = rot90(data3(i).color, 3);
    imagesc(kymograph, [0,max(kymograph, [], 'all')/4]); %***************
    set(gcf,'Position',[2.0000, 26.6667,589.6667,619.6667]); %laptop 
    ksize = size(kymograph);
    kw=ksize(:,2);
    kh=ksize(:,1);
    prompt = 'How many traces to extract?';
    num_of_traces = input(prompt);
    for j = 1:num_of_traces
        filename = [data3(i).name, '_tracenum_', num2str(j)];
        structure_name(counter).name = filename;
        p = ginput(2); 
        sp(1) = min(floor(p(1)), floor(p(2))); %xmin
        sp(2) = min(floor(p(3)), floor(p(4))); %ymin
        sp(3) = max(ceil(p(1)), ceil(p(2)));   %xmax
        sp(4) = max(ceil(p(3)), ceil(p(4)));   %ymax
        if sp(1)<1
            sp(1)=1;
        end
        if sp(2)<1
            sp(2)=1;
        end
        if sp(3)>(kw-1)
            sp(3)=kw;
        end
        if sp(4)>(kh-1)
            sp(4)=kh;
        end
        crop = kymograph(sp(2):sp(4), sp(1): sp(3),:);
        structure_name(counter).crop = crop;
        close;
        structure_name(counter).crop_coordinates = [sp(2),sp(4),sp(1),sp(3)];
        figure;
          if max(kymograph,[], 'all') > 30
            imagesc(crop,[0,max(crop, [], 'all')/2])  
            set(gcf,'Position',[2.0000, 26.6667,589.6667,619.6667]);
            disp(['max intensity is ', num2str(max(kymograph,[], 'all'))]);
          else
            imagesc(crop);      
            set(gcf,'Position',[2.0000, 26.6667,589.6667,619.6667]);
          end
        ksize = size(crop);
        kw=ksize(:,2);
        kh=ksize(:,1);
        p = ginput(2); 
        sp(1) = min(floor(p(1)), floor(p(2))); %xmin
        sp(2) = min(floor(p(3)), floor(p(4))); %ymin
        sp(3) = max(ceil(p(1)), ceil(p(2)));   %xmax
        sp(4) = max(ceil(p(3)), ceil(p(4)));   %ymax
            if sp(1)<1
                sp(1)=1;
            end

            if sp(2)<1
                sp(2)=1;
            end

            if sp(3)>(kw-1)
                sp(3)=kw;
            end

            if sp(4)>(kh-1)
                sp(4)=kh;
            end
        BG = crop(sp(2):sp(4), sp(1): sp(3),:);
        BG = reshape(BG.',1,[]);

        d=mean(BG);
        dsd=2*std(BG);
        dmin=d-(2*dsd);
        dmax=d+(2*dsd);
        structure_name(counter).dmin = dmin;
        structure_name(counter).dmax = dmax;        
        structure_name(counter).d = d;

        close;

        figure;
        imagesc(crop,[0,max(crop, [], 'all')/2]);
        set(gcf,'Position',[2.0000, 26.6667,589.6667,619.6667]); %laptop
        p = ginput(2); 
        sp(11) = min(floor(p(1)), floor(p(2))); %xmin
        sp(12) = min(floor(p(3)), floor(p(4))); %ymin
        sp(13) = max(ceil(p(1)), ceil(p(2)));   %xmax
        sp(14) = max(ceil(p(3)), ceil(p(4)));   %ymax
            if sp(11)<1
                sp(11)=1;
            end

            if sp(12)<1
                sp(12)=1;
            end

            if sp(13)>(kw-1)
                sp(13)=kw;
            end

            if sp(14)>(kh-1)
                sp(14)=kh;
            end
        peak = crop(sp(12):sp(14), sp(11): sp(13),:);

        peak = reshape(peak.',1,[]);
        a=mean(peak);
        amin=a-(3*dsd);
        amax=a+(3*dsd);
        structure_name(counter).amin = amin;
        structure_name(counter).amax = amax;
        structure_name(counter).a = a;

        close;
        sz=size(crop);
        t=sz(:,1);
        w=sz(:,2);

        b=(sp(11)+sp(13))/2;
        bmin=b-5;
        bmax=b+5;
        structure_name(counter).bmin = bmin;
        structure_name(counter).bmax = bmax;
        structure_name(counter).b = b;

        wrange=[1:1:w];
        transpose(wrange);
        structure_name(counter).wrange = wrange;
        clf
        counter = counter + 1;

        cd(segmentation_dir);
        save('holdingplace.mat', 'structure_name');
        if j ~= num_of_traces
            imagesc(kymograph,[0,max(kymograph, [], 'all')/2]);
            set(gcf,'Position',[2.0000, 26.6667,589.6667,619.6667]); %laptop
            ksize = size(kymograph);
            kw=ksize(:,2);
            kh=ksize(:,1);
        else
        end
disp(['this', num2str(j), 'out of', num2str(num_of_traces)])
    end
disp(['you are on trace ', num2str(i), ' out of ', num2str(length(data3))])
tic
end
end