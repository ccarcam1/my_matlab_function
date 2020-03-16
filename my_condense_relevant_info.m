function fitting_MSD_struct = my_condense_relevant_info(color, data, gaussfitting, structure_name)

names_of_traces = cell([length(structure_name) 1]);
for i = 1:length(structure_name)
    names_of_traces{i} = structure_name(i).name;
end

location_of_names = cell([length(data) 1]);
for i = 1:length(data)
    location_of_names{i} = contains(names_of_traces, data(i).name);
end

location_for_newstruct = cell([length(data) 1]);
for i = 1:length(data)
    if not(all(location_of_names{i} == 0))
        location_for_newstruct{i} = find(location_of_names{i} == 1);
    else
    end
end

for i = 1:length(structure_name)
    fitting_MSD_struct(i).name = structure_name(i).name;
    fitting_MSD_struct(i).crop_coordinates = structure_name(i).crop_coordinates;
    fitting_MSD_struct(i).crop = structure_name(i).crop;

end
   
for i = 1:length(data)
    if not(isempty(location_for_newstruct{i}))
        for j = 1:length(location_for_newstruct{i})   
        fitting_MSD_struct(location_for_newstruct{i}(j)).line_time = data(i).line_time;
            if strcmp(color,'red')
                fitting_MSD_struct(location_for_newstruct{i}(j)).full_kymo = data(i).red_kymo;
            elseif strcmp(color,'green')
                fitting_MSD_struct(location_for_newstruct{i}(j)).full_kymo = data(i).green_kymo;
            end
        end
    else
    end
end

for i = 1:length(structure_name)
    fitting_MSD_struct(i).intensity = gaussfitting(i).data.intensity;
    fitting_MSD_struct(i).pixel = gaussfitting(i).data.pixel;
    fitting_MSD_struct(i).timepix = gaussfitting(i).data.timepix;
end
end

