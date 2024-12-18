antenna_design

num_ant_elements = 27;
image_size = 32;
num_image_pixels = image_size * image_size;
number_looks = 5;

frequency = 10E9;
lambda = 3E8 / frequency;

image_x_coords = ones(num_image_pixels,1) * rem(0:num_image_pixels-1,image_size);
image_y_coords = ones(num_image_pixels,1) * floor((0:num_image_pixels-1) / image_size);

image_x_coords = image_x_coords / image_size - 0.5;
image_y_coords = image_y_coords / image_size - 0.5;

image_x_coords = image_x_coords * 0.35;
image_y_coords = image_y_coords * 0.35;

mapping = zeros(num_ant_elements,num_image_pixels,number_looks);

fourier_point_x = zeros(27,27,5);
fourier_point_y = zeros(27,27,5);

for earth_moving = 1:number_looks,
  theta = 10 * pi * earth_moving / 180;
  
  rot_matrix = [cos(theta),sin(theta);-sin(theta),cos(theta)];
  comp_ant_coords = [ant_x_coords; ant_y_coords];
  rot_comp_ant_coords = rot_matrix * comp_ant_coords;

  moved_ant_x_coords = rot_comp_ant_coords(1,:);
  moved_ant_y_coords = rot_comp_ant_coords(2,:);

  plot(moved_ant_x_coords,moved_ant_y_coords,'.');
  input('hit return')

  ant_x_coords_array = moved_ant_x_coords' * ones(1,num_image_pixels);
  ant_y_coords_array = moved_ant_y_coords' * ones(1,num_image_pixels);

  mapping(:,:,earth_moving) = exp((j*2*pi/lambda) * (ant_x_coords_array * image_x_coords + ant_y_coords_array * image_y_coords));
 
  for l1 = 1:27,
   for l2 = 1:27,
    fourier_point_x(l1,l2,earth_moving) = moved_ant_x_coords(l1) - moved_ant_x_coords(l2);
    fourier_point_y(l1,l2,earth_moving) = moved_ant_y_coords(l1) - moved_ant_y_coords(l2);
   end
  end
end

mapping_t = zeros(num_image_pixels, num_ant_elements, number_looks);

for earth_moving = 1:number_looks,
  mapping_t(:,:,earth_moving) = mapping(:,:,earth_moving)';
end


