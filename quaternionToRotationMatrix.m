function rotationMatrix = quaternionToRotationMatrix(quaternion, varargin)
%quaternionToRotationMatrix - Convert quaternion to rotation matrix
%
% Syntax: rotationMatrix = quaternionToRotationMatrix(quaternion, options)
%
% > Parameter introduction:
%   @param quaternion  A vector of length 4, eg. [q0, q1, q2, q4]
%   ---
%   @return rotationMatrix    The default is 3x3 rotation matrix
% 
% > Options:
%   'T'     Output a homogeneous matrix.(4x4)
% 
% > Examples:
%   R = quaternionToRotationMatrix([0.5 pi/3 pi/4 pi/5])
%   T = quaternionToRotationMatrix([0.5 pi/3 pi/4 pi/5], 'T')
% 
% > Notes:
%   - 
% 
% See also rpyAnglesToRotationMatrix, rotationMatrixToRotationMatrix, axisAngleToRotationMatrix, eulerAnglesToRotationMatrix
    
    opt = argsParse(varargin);

    quaternion = quaternion/norm(quaternion);
    s = quaternion(1);
    v = quaternion(2:4);
    v_mat = [0 -v(3) v(2); v(3) 0 -v(1); -v(2) v(1) 0];
    rotationMatrix = v'*v + s^2*eye(3) + 2*s*v_mat + v_mat^2;
    if opt.T
        rotationMatrix = [rotationMatrix, zeros(3,1); zeros(1,3),1];
    end
end