% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2515.525858594703550 ; 2523.738394307343697 ];

%-- Principal point:
cc = [ 1149.511899415826747 ; 1507.125332670882017 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.083996787391362 ; -0.198838745951161 ; -0.002046506324835 ; -0.000459441680988 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.533261781251497 ; 9.878585383110753 ];

%-- Principal point uncertainty:
cc_error = [ 9.362913340684372 ; 9.630320116759361 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.008306958677373 ; 0.027726193261029 ; 0.001296807326484 ; 0.001525553786476 ; 0.000000000000000 ];

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
omc_1 = [ 1.890184e+00 ; 1.962725e+00 ; -9.126941e-01 ];
Tc_1  = [ -6.256903e+02 ; -5.855543e+02 ; 3.131572e+03 ];
omc_error_1 = [ 2.472420e-03 ; 3.924161e-03 ; 5.669724e-03 ];
Tc_error_1  = [ 1.174460e+01 ; 1.189609e+01 ; 1.120481e+01 ];

%-- Image #2:
omc_2 = [ 2.225675e+00 ; 1.206019e+00 ; -3.778494e-01 ];
Tc_2  = [ -8.152194e+02 ; -7.576196e+02 ; 3.180598e+03 ];
omc_error_2 = [ 3.650085e-03 ; 2.999354e-03 ; 5.238367e-03 ];
Tc_error_2  = [ 1.202469e+01 ; 1.208821e+01 ; 1.275853e+01 ];

%-- Image #3:
omc_3 = [ 1.890953e+00 ; 1.810956e+00 ; -6.479247e-01 ];
Tc_3  = [ -5.746045e+02 ; -4.713452e+02 ; 2.709280e+03 ];
omc_error_3 = [ 2.603384e-03 ; 3.331134e-03 ; 5.180815e-03 ];
Tc_error_3  = [ 1.004956e+01 ; 1.025774e+01 ; 9.836476e+00 ];

%-- Image #4:
omc_4 = [ 2.188558e+00 ; 2.182116e+00 ; -1.014362e-01 ];
Tc_4  = [ -7.063068e+02 ; -3.502112e+02 ; 2.401331e+03 ];
omc_error_4 = [ 3.496184e-03 ; 3.451821e-03 ; 7.416016e-03 ];
Tc_error_4  = [ 8.996337e+00 ; 9.217875e+00 ; 1.012874e+01 ];

%-- Image #5:
omc_5 = [ 2.381428e+00 ; 1.602459e+00 ; -3.795498e-01 ];
Tc_5  = [ -7.653813e+02 ; -2.385685e+02 ; 2.988208e+03 ];
omc_error_5 = [ 4.005143e-03 ; 2.995264e-03 ; 6.767254e-03 ];
Tc_error_5  = [ 1.110234e+01 ; 1.137196e+01 ; 1.206582e+01 ];

%-- Image #6:
omc_6 = [ 2.041513e+00 ; 2.191442e+00 ; -3.633888e-01 ];
Tc_6  = [ -8.744263e+02 ; -8.164208e+02 ; 3.435807e+03 ];
omc_error_6 = [ 3.088631e-03 ; 4.453202e-03 ; 7.890028e-03 ];
Tc_error_6  = [ 1.293073e+01 ; 1.306745e+01 ; 1.422021e+01 ];

%-- Image #7:
omc_7 = [ 2.450432e+00 ; 1.538957e+00 ; -1.564946e-01 ];
Tc_7  = [ -8.002194e+02 ; -5.984007e+02 ; 2.632275e+03 ];
omc_error_7 = [ 3.766804e-03 ; 2.805750e-03 ; 6.444043e-03 ];
Tc_error_7  = [ 9.938001e+00 ; 9.965383e+00 ; 1.117516e+01 ];

%-- Image #8:
omc_8 = [ 2.681974e+00 ; 1.121206e+00 ; -1.049709e-01 ];
Tc_8  = [ -9.775912e+02 ; -5.999863e+02 ; 2.862299e+03 ];
omc_error_8 = [ 4.225295e-03 ; 2.947278e-03 ; 7.117023e-03 ];
Tc_error_8  = [ 1.083599e+01 ; 1.100955e+01 ; 1.236210e+01 ];

%-- Image #9:
omc_9 = [ 1.923029e+00 ; 2.132106e+00 ; -5.004832e-01 ];
Tc_9  = [ -6.438374e+02 ; -1.070857e+03 ; 2.945806e+03 ];
omc_error_9 = [ 2.489450e-03 ; 4.052953e-03 ; 6.290653e-03 ];
Tc_error_9  = [ 1.133172e+01 ; 1.116229e+01 ; 1.199798e+01 ];

%-- Image #10:
omc_10 = [ -1.225087e-02 ; -3.048358e+00 ; 5.951501e-01 ];
Tc_10  = [ 8.277671e+02 ; -1.666977e+03 ; 4.220879e+03 ];
omc_error_10 = [ 2.776671e-03 ; 5.068065e-03 ; 7.649661e-03 ];
Tc_error_10  = [ 1.641871e+01 ; 1.622537e+01 ; 1.793979e+01 ];

%-- Image #11:
omc_11 = [ 2.190886e+00 ; 2.146937e+00 ; -6.444540e-02 ];
Tc_11  = [ -7.081428e+02 ; -1.132930e+03 ; 2.258417e+03 ];
omc_error_11 = [ 3.226120e-03 ; 4.420276e-03 ; 7.804934e-03 ];
Tc_error_11  = [ 8.943988e+00 ; 8.666750e+00 ; 1.052701e+01 ];

%-- Image #12:
omc_12 = [ 1.752893e+00 ; 2.505773e+00 ; -6.496394e-01 ];
Tc_12  = [ -2.273684e+02 ; -9.924732e+02 ; 2.781389e+03 ];
omc_error_12 = [ 1.775068e-03 ; 4.061425e-03 ; 6.501726e-03 ];
Tc_error_12  = [ 1.054960e+01 ; 1.041930e+01 ; 1.110758e+01 ];

%-- Image #13:
omc_13 = [ -2.018227e+00 ; -2.056972e+00 ; -4.828253e-01 ];
Tc_13  = [ -6.917294e+02 ; -5.349791e+02 ; 2.304682e+03 ];
omc_error_13 = [ 3.089138e-03 ; 3.795433e-03 ; 6.507390e-03 ];
Tc_error_13  = [ 8.754631e+00 ; 8.914252e+00 ; 1.049498e+01 ];

%-- Image #14:
omc_14 = [ 1.999564e+00 ; 1.307111e-01 ; -3.134532e-01 ];
Tc_14  = [ -5.113109e+02 ; 7.305867e+02 ; 2.237495e+03 ];
omc_error_14 = [ 3.693115e-03 ; 2.341577e-03 ; 4.065882e-03 ];
Tc_error_14  = [ 8.591066e+00 ; 8.935784e+00 ; 9.978226e+00 ];

%-- Image #15:
omc_15 = [ 2.004159e+00 ; 1.659114e+00 ; -6.928512e-01 ];
Tc_15  = [ -7.423887e+02 ; -1.178782e+03 ; 3.323725e+03 ];
omc_error_15 = [ 2.976585e-03 ; 3.849566e-03 ; 5.489005e-03 ];
Tc_error_15  = [ 1.285790e+01 ; 1.276681e+01 ; 1.282110e+01 ];

%-- Image #16:
omc_16 = [ 1.833123e+00 ; 1.584277e+00 ; -6.440139e-01 ];
Tc_16  = [ -7.699568e+02 ; -1.084137e+03 ; 2.907031e+03 ];
omc_error_16 = [ 2.999033e-03 ; 3.780875e-03 ; 4.938352e-03 ];
Tc_error_16  = [ 1.125393e+01 ; 1.121205e+01 ; 1.114062e+01 ];

%-- Image #17:
omc_17 = [ 2.932425e+00 ; 9.582880e-01 ; 4.081772e-01 ];
Tc_17  = [ -7.265268e+02 ; 1.836054e+02 ; 2.588309e+03 ];
omc_error_17 = [ 5.181086e-03 ; 1.660987e-03 ; 7.441155e-03 ];
Tc_error_17  = [ 9.808200e+00 ; 9.949207e+00 ; 1.176919e+01 ];

