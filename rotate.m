function rotationMatrix = rotate(axis, angle, varargin)
%rotation - Calculates the rotation matrix for rotation about the specified axis.
%
% Syntax: rotationMatrix = rotate(axis, angle, options)
%
% > Parameter introduction:
%   @param axis  A char of specified axis, eg. 'x', 'y', 'z'
%   @param angle  rotation angle
%   ---
%   @return rotationMatrix    The default is 3x3 rotation matrix
% 
% > Options:
%   'deg'   accept angles in degrees.(The default is radian)
%   'T'     Output a homogeneous matrix.(4x4)
% 
% > Examples:
%   R = rotate('x', pi/3)
%   R = rotate('x', 60, 'deg')
%   T = rotate('x', 60, 'deg', 'T')
% 
% > Notes:
%   - 
% 
% See also rpyAnglesToRotationMatrix, quaternionToRotationMatrix, axisAngleToRotationMatrix, eulerAnglesToRotationMatrix, rotationVectorToRotationMatrix
    opt = argsParse(varargin);
    if opt.deg
        angle = deg2rad(angle);
    end

    switch axis
        case 'x'
            rotationMatrix = [1, 0, 0; 0, cos(angle), -sin(angle); 0, sin(angle), cos(angle)];
        case 'y'
            rotationMatrix = [cos(angle), 0, sin(angle); 0, 1, 0; -sin(angle), 0, cos(angle)];
        case 'z'
            rotationMatrix = [cos(angle), -sin(angle), 0; sin(angle), cos(angle), 0; 0, 0, 1];
        otherwise
            error('Shaft input error');
    end
    if opt.T
        rotationMatrix = [rotationMatrix, zeros(3,1); zeros(1,3),1];
    end
end

