shifted_up = zeros(image_size,image_size);
shifted_down = zeros(image_size,image_size);
shifted_left = zeros(image_size,image_size);
shifted_right = zeros(image_size,image_size);

shifted_ul = zeros(image_size,image_size);
shifted_ur = zeros(image_size,image_size);
shifted_dl = zeros(image_size,image_size);
shifted_dr = zeros(image_size,image_size);

x = unconstrained;

change = ones(32) * 6.02E23;

shifted_up(1:image_size-1,:) = x(2:image_size,:);
shifted_down(2:image_size,:) = x(1:image_size-1,:);
shifted_left(:,1:image_size-1) = x(:,2:image_size);
shifted_right(:,2:image_size) = x(:,1:image_size-1);

shifted_up(image_size,:) = x(image_size,:);
shifted_down(1,:) = x(1,:);
shifted_left(:,image_size) = x(:,image_size);
shifted_right(:,1) = x(:,1);

shifted_ul(:,1:image_size-1) = shifted_up(:,2:image_size);
shifted_ur(:,2:image_size) = shifted_up(:,1:image_size-1);
shifted_dl(:,1:image_size-1) = shifted_down(:,2:image_size);
shifted_dr(:,2:image_size) = shifted_down(:,1:image_size-1);

shifted_ul(:,image_size) = shifted_up(:,image_size);
shifted_ur(:,1) = shifted_up(:,1);
shifted_dl(:,image_size) = shifted_down(:,image_size);
shifted_dr(:,1) = shifted_down(:,1);

neighborhood_sum = shifted_up + shifted_down + shifted_left + shifted_right;
neighborhood_diag_sum = shifted_ul + shifted_ur + shifted_dl + shifted_dr;
 
side_weight = alpha;
diag_weight = alpha / sqrt(2);
middle_weight = 1;
total = side_weight * 4 + diag_weight * 4 + middle_weight;

side_weight = side_weight / total;
diag_weight = diag_weight / total;
middle_weight = middle_weight / total;

x = side_weight * neighborhood_sum + diag_weight * neighborhood_diag_sum + middle_weight * x;

%for l1 = 1:image_size,
%  for l2 = 1:image_size,
%   x(l1,l2) = median([x(l1,l2), shifted_up(l1,l2), shifted_down(l1,l2), shifted_right(l1,l2), shifted_left(l1,l2), shifted_ul(l1,l2), shifted_ur(l1,l2), shifted_dl(l1,l2), shifted_dr(l1,l2)]);
%  end
%end


