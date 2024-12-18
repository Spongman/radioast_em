load bars_median_filter
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_median_filter.png')

load bars_linear_a0p001
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_linear_a0p001.png')

load bars_linear_a0p003.mat
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_linear_a0p003.png')

load bars_goods_a0p002.mat
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_goods_a0p002.png')

load bars_goods_a0p005.mat
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_goods_a0p005.png')

load bars_silver_a0p002
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_silver_a0p002.png')

load bars_silver_a0p005
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_silver_a0p005.png')

%%%%%

load pies_median_filter
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_median_filter.png')

load pies_linear_a0p001
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_linear_a0p001.png')

load pies_linear_a0p003
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_linear_a0p003.png')

load pies_goods_a0p002
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_goods_a0p002.png')

load pies_goods_a0p005
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_goods_a0p005.png')

load pies_silver_a0p002
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_silver_a0p002.png')

load pies_silver_a0p005
data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_silver_a0p005.png')

%%%%%

load pies_unconstrained_use
data = reshape(sigma_est_iterates(:,1),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_unconstrained_100iter.png')

data = reshape(sigma_est_iterates(:,2),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_unconstrained_200iter.png')

data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'pies_unconstrained_1000iter.png')

unconstrained = reshape(sigma_est_iterates(:,10),32,32);
median_smooth
imwrite(256 * x / max(max(x)),hot,'pies_postfilter_median.png')

load bars_unconstrained_use
data = reshape(sigma_est_iterates(:,1),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_unconstrained_100iter.png')

data = reshape(sigma_est_iterates(:,2),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_unconstrained_200iter.png')

data = reshape(sigma_est_iterates(:,10),32,32);
imwrite(256 * data / max(max(data)),hot,'bars_unconstrained_1000iter.png')

unconstrained = reshape(sigma_est_iterates(:,10),32,32);
median_smooth
imwrite(256 * x / max(max(x)),hot,'bars_postfilter_median.png')



