This is MALTAB code and data for the paper "Radio-Astronomy Imaging of Extended Objects via an Expectation-Maximization Algorithm for Structured Covariance Estimation." When I wrote this code, I was just trying to get the work done and wasn't intending to release it, so it is not the most polished code in the world; some of my choices of variable names are idiosyncratic. I'm leaving it as-is since I'm afraid that I'll break something in the process of making it more elegant. If you have trouble figuring it out, e-mail me at lanterma@ece.gatech.edu and I will try to remember what's going on in the code.

make_mapping.m -- you must run this script before doing anything else; it sets up a bunch of variables related to the antenna array, and creates a "mapping" matrix that corresponds to capital Gamma from the paper (and a variable "mapping_t" which is its Hermitian transpose)

antenna_design.m -- called by make_mapping.m

These .mat files contain "data_cov," a 3-D array. The last dimension corresponds to the look position, which is the m index in the paper (here M=5). The first two dimensions are the sample covariance matrix for a particular look. You can load the appropriate data file and then run make_data_final (which is somewhat misnamed; it's really the main EM algorithm, but a segment of it can make new data if you uncomment the appropriate lines).

data_cov_bars.mat -- for the bar phantom
data_cov_pies.mat -- for the pie phantom

These are the original "truth" images. They are raw files of 64x64 floats, which may be read into MATLAB using a command such as floatload('bars.pht',64,64). Note that I downsample them to 32x32 images for use in the paper by skipping every other sample (to maintain sharp edges, although this means the thin bars in the upper left of the bar phantom merge into a single block):

bars.pht
pies.pht

make_data_final -- this is the main algorithm, but it also creates data. If you want to create a new set of data, uncomment the set of lines starting with 

% data_cov = zeros(num_ant_elements,num_ant_elements,number_looks);

And ending with

%  data_cov(:,:,earth_moving) = data_cov_sum / loop;
%end

goods_smooth, silver_smooth, linear_smooth, median_smooth, eggermont_smooth -- code for various smoothing steps associated with various regularization techniques (note I didn't actually include any Eggermont results in the paper since it was already getting long; I'm including it as a bonus). You can uncomment the appropriate line calling the appropriate code in make_data_final, or you can uncomment this bit of code for entropy regularization (note I didn't include entropy results either since they didn't look very good):

%   for loop = 1:num_image_pixels,
%     Q_GLOBAL = sigma_est(loop);
%     sigma_est(loop) = fzero('entropy_condition',Q_GLOBAL);  
%    end

Or, you can comment out all of that for unconstrained EM.

There's some stale code, commented out in make_data_final from some early experiments; I don't recommend going there. 

entropy_conditional -- support function for entropy regularization

floatload -- nothing fancy, just loads a file of 32-bit floats

The "results" folder contains .mat files with sigma_est_iterates variables that are 1024 by
10 matrices. I stored the result after each 100 iterations; this corresponds to the 10
Dimension. The 1024 is a 32x32 image stretched out as a vector. You may visualize one of the images using a command such as imagesc(abs(reshape(sigma_est_iterates(:,10),32,32))).

To create the images for the paper, run make_smooth_images.m while in the main directory; then change to the results directory and run make_other_images.m there.
