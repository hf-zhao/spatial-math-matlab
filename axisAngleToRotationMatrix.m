function rotationMatrix = axisAngleToRotationMatrix(axisAngle, varargin)
%axisAngleToRotationMatrix - Convert axis angle to rotation matrix
%
% > Syntax: rotationMatrix = axisAngleToRotationMatrix(axisAngle, options)
%
% > Parameter introduction:
%   @param axisAngle  A vector of length 4, eg. [kx, ky, kz, angle]
%   ---
%   @return rotationMatrix    The default is 3x3 rotation matrix
% 
% > Options:
%   'deg'   accept angles in degrees.(The default is radian)
%   'T'     Output a homogeneous matrix.(4x4)
% 
% > Examples:
%   R = axisAngleToRotationMatrix([0 0 1 pi/3])
%   R = axisAngleToRotationMatrix([0 1 1 60], 'deg')
%   T = axisAngleToRotationMatrix([1 0 1 60], 'deg', 'T')
% 
% > Notes:
%   - 
% 
% See also rotationVectorToMatrix, quaternionToRotationMatrix, rpyAnglesToRotationMatrix, eulerAnglesToRotationMatrix

    % Check whether the corner is 0
    angle = axisAngle(4);
    if abs(angle) < eps
        tranform = eye(3);
        return;
    end
    % Check whether the rotation axis is 0 vector
    if isequal(abs(axisAngle(1:3)) < eps, [1 1 1])
        tranform = eye(3);
        return;
    end

    opt = argsParse(varargin);

    if opt.deg
        angle = deg2rad(angle);
    end

    kx = axisAngle(1)/norm(axisAngle(1:3));
    ky = axisAngle(2)/norm(axisAngle(1:3));
    kz = axisAngle(3)/norm(axisAngle(1:3));
    Vers = 1 - cos(angle);

    rotationMatrix = [kx^2*Vers+cos(angle), ky*kx*Vers-kz*sin(angle), kz*kx*Vers+ky*sin(angle);
    kx*ky*Vers+kz*sin(angle), ky^2*Vers+cos(angle), kz*ky*Vers-kx*sin(angle);
    kx*kz*Vers-ky*sin(angle), ky*kz*Vers+kx*sin(angle), kz^2*Vers+cos(angle)];

    if opt.T
        rotationMatrix = [rotationMatrix, zeros(3,1); zeros(1,3),1];
    end
end