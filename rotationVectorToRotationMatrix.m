function rotationMatrix = rotationVectorToRotationMatrix(rotationVector, varargin)
%rotationVectorToRotationMatrix - Convert rotation vector to rotation matrix
%
% Syntax: rotationMatrix = rotationVectorToRotationMatrix(rotationVector, options)
%
% > Parameter introduction:
%   @param rotationVector  A vector of length 3, eg. [RX, RY, RZ]
%   ---
%   @return rotationMatrix    The default is 3x3 rotation matrix
% 
% > Options:
%   'T'     Output a homogeneous matrix.(4x4)
% 
% > Examples:
%   R = rotationVectorToRotationMatrix([pi/3 pi/4 pi/5])
%   T = rotationVectorToRotationMatrix([pi/3 pi/4 pi/5], 'T')
% 
% > Notes:
%   - 
% 
% See also rpyAnglesToRotationMatrix, quaternionToRotationMatrix, axisAngleToRotationMatrix, eulerAnglesToRotationMatrix
    opt = argsParse(varargin);    

    angle = norm(rotationVector);
    kx = rotationVector(1)/angle;
    ky = rotationVector(2)/angle;
    kz = rotationVector(3)/angle;
    rotationMatrix = axAng2mat([kx, ky, kz, angle]);
    if opt.T
        rotationMatrix = [rotationMatrix, zeros(3,1); zeros(1,3),1];
    end
end