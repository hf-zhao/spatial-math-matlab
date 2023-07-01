function rotationMatrix = eulerAnglesToRotationMatrix(eulerAngles, varargin)
%eulerAnglesToRotationMatrix - Convert euler angles to rotation matrix
%
% Syntax: rotationMatrix = eulerAnglesToRotationMatrix(eulerAngles, options)
%
% > Parameter introduction:
%   @param eulerAngles  A vector of length 3, eg. [angle1, angle2, angle3]
%   ---
%   @return rotationMatrix    The default is 3x3 rotation matrix
% 
% > Options:
%   'deg'   accept angles in degrees.(The default is radian)
%   'T'     Output a homogeneous matrix.(4x4)
%   'seq'   Order around Euler's angles, eg. 'zyx', 'zyz', ...(The default sequence is 'zyx')
% 
% > Examples:
%   R = eulerAnglesToRotationMatrix([pi/3 pi/4 pi/5])
%   R = eulerAnglesToRotationMatrix([pi/3 pi/4 pi/5], 'seq', 'zyx')
%   T = eulerAnglesToRotationMatrix([pi/3 pi/4 pi/5], 'seq', 'zyx', 'T')
% 
% > Notes:
%   - 
% 
% See also rpyAnglesToRotationMatrix, rotationMatrixToRotationMatrix, axisAngleToRotationMatrix, quaternionToRotationMatrix

    opt = argsParse(varargin);
    if opt.deg
        eulerAngles = deg2rad(eulerAngles);
    end

    switch opt.seq
        case 'zyx'
            rotationMatrix = rotate('z', eulerAngles(1)) * rotate('y', eulerAngles(2)) * rotate('x', eulerAngles(3));
    end

    if opt.T
        rotationMatrix = [rotationMatrix, zeros(3,1); zeros(1,3),1];
    end

end