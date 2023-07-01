function rotationMatrix = rpyAnglesToRotationMatrix(rpyAngles, varargin)
%rpyAnglesToRotationMatrix - Convert roll pitch yaw angles to rotation matrix
%
% > Syntax: rotationMatrix = rpyAnglesToRotationMatrix(axisAngle, options)
%
% > Parameter introduction:
%   @param rpyAngles  A vector of length 3, eg. [roll, pitch, yaw]
%   ---
%   @return rotationMatrix    The default is 3x3 rotation matrix
% 
% > Options:
%   'deg'   accept angles in degrees.(The default is radian)
%   'T'     Output a homogeneous matrix.(4x4)
% 
% > Examples:
%   R = rpyAnglesToRotationMatrix([pi/3 pi/4 pi/5])
%   R = rpyAnglesToRotationMatrix([60 45 30], 'deg')
%   T = rpyAnglesToRotationMatrix([45 60 30], 'deg', 'T')
% 
% > Notes:
%   - 
% 
% See also rotationVectorToMatrix, quaternionToRotationMatrix, axisAngleToRotationMatrix, eulerAnglesToRotationMatrix
    opt = argsParse(varargin);
    if opt.deg
        rpyAngles = deg2rad(rpyAngles);
    end

    rotationMatrix = rotate('z', rpyAngles(1)) * rotate('y', rpyAngles(2)) * rotate('x', rpyAngles(3));
    if opt.T
        rotationMatrix = [rotationMatrix, zeros(3,1); zeros(1,3),1];
    end
end