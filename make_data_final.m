number_looks = 5;
noise_power = 0.0001;

image_size = 32;
num_image_pixels = image_size * image_size;
sigma_est_iterates = zeros(num_image_pixels,10);

global ALPHA_GLOBAL
global Q_GLOBAL

original = floatload('bars.pht',64,64) / 100;

truth = original(1:2:63,1:2:64);
truth = truth / max(max(truth));

%truth = zeros(image_size,image_size);

%truth(5,5) = 1;
%truth(6,5:6) = ones(1,2);
%truth(7,5:7) = ones(1,3);
%truth(8,5:8) = ones(1,4);
%truth(9,5:9) = ones(1,5);
%truth(10,5:10) = ones(1,6);
%truth(11,5:11) = ones(1,7);
%truth(12,5:12) = ones(1,8);

%truth(2:3,12:15) = ones(2,4);

flat_truth = reshape(truth,num_image_pixels,1);

%data_cov = zeros(num_ant_elements,num_ant_elements,number_looks);
%data_cov_sum = zeros(num_ant_elements,num_ant_elements);

%for earth_moving = 1:number_looks,
%  data_cov_sum = zeros(num_ant_elements,num_ant_elements);
%  for loop = 1:500,  
%    original_rp = sqrt(flat_truth / 2) .* (randn(num_image_pixels,1) + j * randn(num_image_pixels,1));
%    data_slice = mapping(:,:,earth_moving) * original_rp + sqrt(noise_power / 2) * (randn(num_ant_elements,1) + j * randn(num_ant_elements,1));
%    data_cov_sum = data_cov_sum + data_slice * data_slice';
%  end
%  data_cov(:,:,earth_moving) = data_cov_sum / loop;
%end

noisemat = eye(27) * noise_power;

sigma_est = ones(num_image_pixels,1);
%sigma_est = flat_truth + 1;

original_alpha = 100;
ALPHA_GLOBAL = original_alpha / (500 * number_looks);

alpha = 0.002;

old_dude = 0;

blah = zeros(num_image_pixels,number_looks);

mapping_times_smat = zeros(27,num_image_pixels);

for iter = 1:1000,
  cumulative_update = zeros(num_image_pixels,1);
  for earth_moving = 1:number_looks,
    
   for row_loop = 1:27,
     mapping_times_smat(row_loop,:) = mapping(row_loop,:,earth_moving) .* sigma_est';
   end
   dude = (mapping_times_smat * mapping_t(:,:,earth_moving) + noisemat);
 
   inv_dude = inv(dude);
   mapping_t_times_inv_dude = mapping_t(:,:,earth_moving) * inv_dude;
   funky = mapping(:,:,earth_moving) - data_cov(:,:,earth_moving) * mapping_t_times_inv_dude';
 
   for diag_loop = 1:num_image_pixels,
     cumulative_update(diag_loop) = cumulative_update(diag_loop) + real(mapping_t_times_inv_dude(diag_loop,:) * funky(:,diag_loop));
   end
   blah(:,earth_moving) = cumulative_update;

  end

  cumulative_update = cumulative_update / number_looks;

  sigma_est = sigma_est - (abs(sigma_est) .^ 2) .* cumulative_update;
%  sigma_est

%   imagesc(reshape(sigma_est,image_size,image_size)); axis square
%   input('hit return')
%   for loop = 1:num_image_pixels,
%     Q_GLOBAL = sigma_est(loop);
%     sigma_est(loop) = fzero('entropy_condition',Q_GLOBAL);  
%    end
   sigma_est_square = reshape(sigma_est,image_size,image_size);
%  almost_smoothed = medfilt2(sigma_est_square);
%   smoothed = sigma_est_square; 
%   smoothed(2:image_size-1,2:image_size-1) = almost_smoothed(2:image_size-1, 2:image_size-1);
%   the_filter = [0 1 0; 1 4 1; 0 1 0];
%   the_filter = the_filter / sum(sum(the_filter));
% the_filter = fspecial('average',[3 3]);
%   almost_smoothed = filter2(the_filter,sigma_est_square);
%   smoothed = sigma_est_square; 
%   smoothed(2:image_size-1,2:image_size-1) = almost_smoothed(2:image_size-1, 2:image_size-1);

%  sigma_est = reshape(smoothed,num_image_pixels,1);
%  imagesc(reshape(sigma_est,image_size,image_size));
%  imagesc((dude));
%  input('hit return')
%  old_dude = dude;

    unconstrained = reshape(sigma_est,image_size,image_size);
    silver_smooth
%   linear_smooth
%   median_smooth
%   eggermont_smooth
%   goods_smooth    
    sigma_est = reshape(x,num_image_pixels,1);
 
%   imagesc(reshape(sigma_est,image_size,image_size)); axis square;
%   input('hit return')

  if (rem(iter,100) == 0),
    sigma_est_iterates(:,floor(iter / 100)) = sigma_est;
  end

  iter  
end



