pies = floatload('pies.pht',64,64);
imwrite(255*pies / max(max(pies)),hot,'pies_phantom.png')

bars = floatload('bars.pht',64,64);
imwrite(255*bars / max(max(bars)),hot,'bars_phantom.png')

make_mapping

load data_cov_bars	

est_cov = zeros(1024,1024);
for m=1:5,
  est_cov = est_cov + mapping_t(:,:,m) * data_cov(:,:,m) * mapping(:,:,m);
end
est = reshape(diag(real(est_cov)),32,32);
imwrite(255*est / max(max(est)),hot,'bars_matched_filter.png')

load data_cov_pies	

est_cov = zeros(1024,1024);
for m=1:5,
  est_cov = est_cov + mapping_t(:,:,m) * data_cov(:,:,m) * mapping(:,:,m);
end
est = reshape(diag(real(est_cov)),32,32);
imwrite(255*est / max(max(est)),hot,'pies_matched_filter.png')