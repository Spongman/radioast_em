% vla most_distant_antenna = 21, 6.4, 1.95, or 0.59 km
most_distant_antenna = 21E3;

alpha = 1.7;
n = 1:9;

radial_spacing = n .^ alpha;
angular_spacing = (0:2) * (2*pi) / 3 + pi / 2;
max_spacing = radial_spacing(9);
ant_scaling = most_distant_antenna / max_spacing;

radials = ones(3,1) * radial_spacing
angulars = angular_spacing' * ones(1,9)

x_coords = radials .* cos(angulars);
y_coords = radials .* sin(angulars);

ant_x_coords = reshape(x_coords,1,27);
ant_y_coords = reshape(y_coords,1,27);

ant_x_coords = ant_x_coords * ant_scaling;
ant_y_coords = ant_y_coords * ant_scaling;