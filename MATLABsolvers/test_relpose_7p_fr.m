 
FPXL = 1; % focal length (in pixels)
KGT = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix K

BASE = 0.1; % baseline length
DS = 1; % distance to scene
WIDTH = 1; % scene width
HEIGHT = 1; % scene height
DEPTH = 0.5; % scene depth, 0 for planar scene

DIRECT = 0.3*rand+0.1; % direction of camera movement: 0.5 for sideway motion, 0 for forward motion
AXIS = 2*rand(3,1)-ones(3,1); % rotation axis
AXIS = AXIS./norm(AXIS,'fro'); % normalize to unit length
ANGLE = (30-5)*rand+5; % uniformly distributed rotation angle (in degrees)
LAMBDA = -0.01; % radial distortion

% generate ground truth camera matrices
[P1gt,P2gt,Rt1gt,Rt2gt] = camerasGen(DIRECT,AXIS,ANGLE,BASE,KGT);
% generate synthetic data
[x1,x2] = makeProj(P1gt,P2gt,WIDTH,HEIGHT,DEPTH,LAMBDA,7);

%x1 = rand(2,7);
%x2 = rand(2,7);

C = coefs_relpose_7p_fr(x1(1:2,:),x2(1:2,:));
[vv,ww,xx,yy,zz] = std_relpose_7p_fr(C);

v = vv(1);
w = ww(1);
x = xx(1);
y = yy(1);
z = zz(1);

mon = [1, z, x, y, v, w, z*w, z^2*w, z*x, z^2*x, y*z, y*z^2, w^2*x, w^2*y, w^2*z^2, w^2*z, w*x^2, w*x, w*y^2, w*y, x^3*z^2, x^3*z, x^2*y, x^2*z^2, z*x^2, x*y^2, x*y, z^2*y^3, y^3*z, y^2*z^2, y^2*z, v^2*w, x^2*v^2, v^2*x, v^2*y, v^2*z, v*w^3, v*w^2, v*w, x^3*v, v*x^2, v*x, v*y^3, v*y^2, v*y, v*z^3, v*z^2, v*z, w^3*z^3, w^3*z^2, z*w^3, w^2*z^3, w*z^3, x^3*z^3, x^2*z^3, x*z^3, y^3*z^3, z^3*y^2, y*z^3, y^2*v^2, v*w*x*y*z^3, v*w*x*y*z^2, v*w*x*y*z, w*x*y*z^2, w*x*y*z, v^2*w*x*z, v^2*x*y*z, v*w^2*x*z^3, v*w^2*x*z^2, v*w^2*x*z, v*w^2*y*z^3, v*w^2*y*z^2, v*w^2*y*z, v*w*x^2*z^3, v*w*x^2*z^2, v*w*x^2*z, y*w*v*x, v*w*x*z^3, v*w*x*z^2, v*w*x*z, v*w*y^2*z^3, v*w*y^2*z^2, z*y^2*w*v, v*w*y*z^3, v*w*y*z^2, v*w*y*z, v*x^2*y*z^3, v*x^2*y*z^2, v*x^2*y*z, v*x*y^2*z^3, v*x*y^2*z^2, v*x*y^2*z, v*x*y*z^3, v*x*y*z^2, z*y*x*v, w*x*y*z^3, v^2*w*y*z, z^2, w^2, x^3, x^2, y^3, y^2, v^2, w^3, z^3, w^2*x*z^2, w^2*x*z, w^2*y*z^2, w^2*y*z, w*x^2*z^2, w*x^2*z, w*x*y, w*x*z^2, w*x*z, w*y^2*z^2, w*y^2*z, w*y*z^2, w*y*z, x^2*y*z^2, x^2*y*z, x*y^2*z^2, z*y^2*x, x*y*z^2, x*y*z, w*v^2*x, v^2*w*z, v^2*x^2*z, y*v^2*x, v^2*x*z, v^2*y*z, v*w^3*z^3, v*w^3*z^2, v*w^3*z, w^2*v*x, y*w^2*v, v*w^2*z^3, v*w^2*z^2, z*w^2*v, x^2*w*v, v*w*x, v*w*y^2, v*w*y, v*w*z^3, v*w*z^2, v*w*z, v*x^3*z^3, v*x^3*z^2, v*x^3*z, y*x^2*v, v*x^2*z^3, v*x^2*z^2, v*x^2*z, y^2*v*x, v*x*y, v*x*z^3, v*x*z^2, v*x*z, v*y^3*z^3, v*y^3*z^2, z*y^3*v, v*y^2*z^3, z^2*y^2*v, v*y^2*z, z^3*y*v, v*y*z^2, v*y*z, w^2*x*z^3, w^2*y*z^3, w*x^2*z^3, w*x*z^3, w*y^2*z^3, w*y*z^3, x^2*y*z^3, x*y^2*z^3, x*y*z^3, y*w*v^2, z*y^2*v^2];

mon = mon/norm(mon,'fro');

for i=1:12
    c = C(i,:)/norm(C(i,:),'fro');
    disp(c*mon');
end

% -----------------------------------------------------------------------

function T = skew(t)
    T = [[0 -t(3) t(2)]; [t(3) 0 -t(1)]; [-t(2) t(1) 0]];
end

% generate camera matrices
function [P1,P2,Rt1,Rt2] = camerasGen(dir,axs,ang,base,Kgt)
    theta = dir*180;
    phi = 360*rand-180;
    t = sind(theta)*base;
    C2 = [sind(phi)*t; cosd(phi)*t; cosd(theta)*base];

    % first camera matrix is P1 = [I 0]
    Rt1 = eye(3,4);

    % Rodrigues' rotation formula
    c = cosd(ang);
    R2 = c*eye(3) + (1-c)*(axs*axs') - sind(ang)*skew(axs);

    % second camera matrix
    Rt2 = [R2, -R2*C2];
    
    P1 = Kgt*Rt1;
    P2 = Kgt*Rt2;
end

% map scene points onto image planes
function [x1,x2] = makeProj(P1,P2,w,h,d,la,n)
    Q = [w*rand(1,n) - 0.5*w*ones(1,n); ...
         h*rand(1,n) - 0.5*h*ones(1,n); ...
         d*rand(1,n) + 1*ones(1,n); ...
         ones(1,n)];

    x1 = P1*Q;
    x1 = x1./(ones(3,1)*x1(3,:));
    x2 = P2*Q;
    x2 = x2./(ones(3,1)*x2(3,:));
end