rows = (1:image_size)' * ones(1,image_size);
columns = rows';

checkerboard = rem(rows + columns,2);
not_checkerboard = ~checkerboard;

shifted_up = zeros(image_size,image_size);
shifted_down = zeros(image_size,image_size);
shifted_left = zeros(image_size,image_size);
shifted_right = zeros(image_size,image_size);

log_shifted_up = zeros(image_size,image_size);
log_shifted_down = zeros(image_size,image_size);
log_shifted_left = zeros(image_size,image_size);
log_shifted_right = zeros(image_size,image_size);

x = unconstrained;

change = ones(32) * 6.02E23;

x_old = x;

for grad_loop = 1:500,
  log_x = log(x);
  
  shifted_up(1:image_size-1,:) = x(2:image_size,:);
  shifted_down(2:image_size,:) = x(1:image_size-1,:);
  shifted_left(:,1:image_size-1) = x(:,2:image_size);
  shifted_right(:,2:image_size) = x(:,1:image_size-1);

  log_shifted_up(1:image_size-1,:) = log_x(2:image_size,:);
  log_shifted_down(2:image_size,:) = log_x(1:image_size-1,:);
  log_shifted_left(:,1:image_size-1) = log_x(:,2:image_size);
  log_shifted_right(:,2:image_size) = log_x(:,1:image_size-1);

  shifted_up(image_size,:) = x(image_size,:);
  shifted_down(1,:) = x(1,:);
  shifted_left(:,image_size) = x(:,image_size);
  shifted_right(:,1) = x(:,1);

  log_shifted_up(image_size,:) = log_x(image_size,:);
  log_shifted_down(1,:) = log_x(1,:);
  log_shifted_left(:,image_size) = log_x(:,image_size);
  log_shifted_right(:,1) = log_x(:,1);

  neighborhood_sum = shifted_up + shifted_down + shifted_left + shifted_right - 4 * x;
  log_neighborhood_sum = log_shifted_up + log_shifted_down + log_shifted_left + log_shifted_right - 4 * log_x; 

  grad_of_penalty = -2 * log_neighborhood_sum ./ x;

  partial_log_n_s = log_shifted_up + log_shifted_down + log_shifted_left + log_shifted_right;

  grad_of_pen_ll = -1 ./ x + unconstrained ./ (x .^ 2) - alpha * grad_of_penalty;

  new_x = x + 0.0005 * grad_of_pen_ll;
  
  x = new_x;

  if ~isreal(x),
    error('Oh no, Mr. Bill!');   
  end

end





