function demo()

%% parameters to change according to your requests
fn_im='./data/input_lowres/plasticbag.png';
fn_mask='./data/trimap_lowres/Trimap1/plasticbag.png';

%% configuration
addpath(genpath('./code'));

%% read image and mask
imdata=imread(fn_im);
mask=getMask_onlineEvaluation(fn_mask);

%% compute alpha matte
[alpha]=learningBasedMatting(imdata,mask);

%% show and save results
figure,subplot(3,1,1); imshow(imdata);
subplot(3,1,2),imshow(uint8(alpha*255));
subplot(3,1,3),imshow(fn_mask);

% imwrite(uint8(alpha*255),fn_save);