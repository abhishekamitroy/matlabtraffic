function matched_percentage=edge_based_match_process(img_edge1,img_edge2)


matched_data = 0;
white_points = 0;
black_points = 0;
x=0;
y=0;
l=0;
m=0;

[rr cc]=size(img_edge1);

for a = 1:1:rr
    for b = 1:1:cc
        if(img_edge1(a,b)==1)
            white_points = white_points+1;
        else
            black_points = black_points+1;
        end
    end
end

%for loop comparing the white (edge points) in the two pictures
for i = 1:1:rr
    for j = 1:1:cc
        if(img_edge1(i,j)==1)&(img_edge2(i,j)==1)
            matched_data = matched_data+1;
            else
                ;
        end
    end
end
total_data = white_points;
matched_percentage = (matched_data/total_data)*100;









