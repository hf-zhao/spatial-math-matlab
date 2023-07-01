function opt = argsParse(args)
%argsParse - Convert axis angle to rotation matrix
%
% > Syntax: opt = argsParse(varargin)
%
% > Notes:
%   - 

    % check angle system
    index = strcmp('deg', args);
    if ~any(index)
        opt.deg = false;
    else
        opt.deg = true;
    end

    % check euler sequence
    index = strcmp('seq', args);
    if ~any(index)
        opt.seq = 'zyx';
    else
        index = find(index)+1;
        opt.seq = args{index};
    end 

    % Output a homogeneous matrix
    index = strcmp('T', args);
    if ~any(index)
        opt.T = false;
    else
        opt.T = true;
    end

end
