% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2515.195836827058884 ; 2523.401978299726579 ];

%-- Principal point:
cc = [ 1149.374342818701734 ; 1506.973474616906287 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.083870607353882 ; -0.198653687809615 ; -0.002077763993986 ; -0.000470713873016 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.551439511864128 ; 9.897599382101896 ];

%-- Principal point uncertainty:
cc_error = [ 9.383384872197176 ; 9.649053555791605 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.008323913093628 ; 0.027782320306409 ; 0.001299105233831 ; 0.001528444988792 ; 0.000000000000000 ];

%-- Image size:
nx = 2268;
ny = 3024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 17;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.890058e+00 ; 1.962646e+00 ; -9.130408e-01 ];
Tc_1  = [ -6.254217e+02 ; -5.853038e+02 ; 3.131677e+03 ];
omc_error_1 = [ 2.477888e-03 ; 3.932813e-03 ; 5.681181e-03 ];
Tc_error_1  = [ 1.177185e+01 ; 1.192110e+01 ; 1.122632e+01 ];

%-- Image #2:
omc_2 = [ 2.225623e+00 ; 1.206031e+00 ; -3.780226e-01 ];
Tc_2  = [ -8.150442e+02 ; -7.574038e+02 ; 3.180227e+03 ];
omc_error_2 = [ 3.657639e-03 ; 3.005934e-03 ; 5.249080e-03 ];
Tc_error_2  = [ 1.205090e+01 ; 1.211177e+01 ; 1.278168e+01 ];

%-- Image #3:
omc_3 = [ 1.890893e+00 ; 1.810929e+00 ; -6.480016e-01 ];
Tc_3  = [ -5.744717e+02 ; -4.711858e+02 ; 2.709025e+03 ];
omc_error_3 = [ 2.608960e-03 ; 3.338256e-03 ; 5.191328e-03 ];
Tc_error_3  = [ 1.007172e+01 ; 1.027800e+01 ; 9.854749e+00 ];

%-- Image #4:
omc_4 = [ 2.188560e+00 ; 2.182094e+00 ; -1.014993e-01 ];
Tc_4  = [ -7.061965e+02 ; -3.500537e+02 ; 2.401058e+03 ];
omc_error_4 = [ 3.503571e-03 ; 3.458867e-03 ; 7.431414e-03 ];
Tc_error_4  = [ 9.016200e+00 ; 9.235930e+00 ; 1.014769e+01 ];

%-- Image #5:
omc_5 = [ 2.381400e+00 ; 1.602409e+00 ; -3.795609e-01 ];
Tc_5  = [ -7.652446e+02 ; -2.383909e+02 ; 2.987850e+03 ];
omc_error_5 = [ 4.013872e-03 ; 3.001469e-03 ; 6.780882e-03 ];
Tc_error_5  = [ 1.112667e+01 ; 1.139416e+01 ; 1.208843e+01 ];

%-- Image #6:
omc_6 = [ 2.041453e+00 ; 2.191375e+00 ; -3.633071e-01 ];
Tc_6  = [ -8.742762e+02 ; -8.162236e+02 ; 3.435390e+03 ];
omc_error_6 = [ 3.095746e-03 ; 4.462729e-03 ; 7.906127e-03 ];
Tc_error_6  = [ 1.295879e+01 ; 1.309281e+01 ; 1.424667e+01 ];

%-- Image #7:
omc_7 = [ 2.450411e+00 ; 1.538959e+00 ; -1.565662e-01 ];
Tc_7  = [ -8.000762e+02 ; -5.982458e+02 ; 2.631985e+03 ];
omc_error_7 = [ 3.774652e-03 ; 2.811458e-03 ; 6.456774e-03 ];
Tc_error_7  = [ 9.959827e+00 ; 9.984881e+00 ; 1.119570e+01 ];

%-- Image #8:
omc_8 = [ 2.681942e+00 ; 1.121209e+00 ; -1.050457e-01 ];
Tc_8  = [ -9.774329e+02 ; -5.998135e+02 ; 2.861960e+03 ];
omc_error_8 = [ 4.233947e-03 ; 2.953290e-03 ; 7.130940e-03 ];
Tc_error_8  = [ 1.085968e+01 ; 1.103099e+01 ; 1.238468e+01 ];

%-- Image #9:
omc_9 = [ 1.923008e+00 ; 2.132113e+00 ; -5.005624e-01 ];
Tc_9  = [ -6.436776e+02 ; -1.070688e+03 ; 2.945514e+03 ];
omc_error_9 = [ 2.494715e-03 ; 4.061444e-03 ; 6.303152e-03 ];
Tc_error_9  = [ 1.135646e+01 ; 1.118419e+01 ; 1.202023e+01 ];

%-- Image #10:
omc_10 = [ -1.222299e-02 ; -3.048305e+00 ; 5.951953e-01 ];
Tc_10  = [ 8.280029e+02 ; -1.666714e+03 ; 4.220361e+03 ];
omc_error_10 = [ 2.782604e-03 ; 5.078336e-03 ; 7.665254e-03 ];
Tc_error_10  = [ 1.645418e+01 ; 1.625710e+01 ; 1.797439e+01 ];

%-- Image #11:
omc_11 = [ 2.190870e+00 ; 2.146938e+00 ; -6.454560e-02 ];
Tc_11  = [ -7.080157e+02 ; -1.132793e+03 ; 2.258189e+03 ];
omc_error_11 = [ 3.232628e-03 ; 4.428855e-03 ; 7.819852e-03 ];
Tc_error_11  = [ 8.963551e+00 ; 8.683758e+00 ; 1.054639e+01 ];

%-- Image #12:
omc_12 = [ 1.752878e+00 ; 2.505768e+00 ; -6.497275e-01 ];
Tc_12  = [ -2.272200e+02 ; -9.923124e+02 ; 2.781114e+03 ];
omc_error_12 = [ 1.778895e-03 ; 4.070001e-03 ; 6.514527e-03 ];
Tc_error_12  = [ 1.057260e+01 ; 1.043975e+01 ; 1.112851e+01 ];

%-- Image #13:
omc_13 = [ -2.018261e+00 ; -2.056992e+00 ; -4.827116e-01 ];
Tc_13  = [ -6.916020e+02 ; -5.348374e+02 ; 2.304401e+03 ];
omc_error_13 = [ 3.095399e-03 ; 3.803492e-03 ; 6.522111e-03 ];
Tc_error_13  = [ 8.773635e+00 ; 8.931661e+00 ; 1.051461e+01 ];

%-- Image #14:
omc_14 = [ 1.999487e+00 ; 1.307301e-01 ; -3.135246e-01 ];
Tc_14  = [ -5.111898e+02 ; 7.307267e+02 ; 2.237143e+03 ];
omc_error_14 = [ 3.700732e-03 ; 2.346965e-03 ; 4.074774e-03 ];
Tc_error_14  = [ 8.609908e+00 ; 8.953109e+00 ; 9.996811e+00 ];

%-- Image #15:
omc_15 = [ 2.004130e+00 ; 1.659124e+00 ; -6.929168e-01 ];
Tc_15  = [ -7.422105e+02 ; -1.178603e+03 ; 3.323424e+03 ];
omc_error_15 = [ 2.982840e-03 ; 3.857829e-03 ; 5.500218e-03 ];
Tc_error_15  = [ 1.288601e+01 ; 1.279195e+01 ; 1.284496e+01 ];

%-- Image #16:
omc_16 = [ 1.833095e+00 ; 1.584291e+00 ; -6.440736e-01 ];
Tc_16  = [ -7.698026e+02 ; -1.083984e+03 ; 2.906784e+03 ];
omc_error_16 = [ 3.005349e-03 ; 3.789075e-03 ; 4.948508e-03 ];
Tc_error_16  = [ 1.127864e+01 ; 1.123419e+01 ; 1.116127e+01 ];

%-- Image #17:
omc_17 = [ 2.932374e+00 ; 9.582828e-01 ; 4.080508e-01 ];
Tc_17  = [ -7.263839e+02 ; 1.837605e+02 ; 2.587949e+03 ];
omc_error_17 = [ 5.191712e-03 ; 1.664279e-03 ; 7.457943e-03 ];
Tc_error_17  = [ 9.829585e+00 ; 9.968446e+00 ; 1.179141e+01 ];

