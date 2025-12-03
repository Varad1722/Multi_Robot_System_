function [relAngles, ranges] = virtualLidar(pos, theta, map, maxRange, nBeams)
% virtualLidar: simple ray-casting LiDAR on an occupancyMap
% pos  : [x;y] position of robot
% theta: heading angle (rad)
% map  : occupancyMap
% maxRange: max LiDAR range
% nBeams  : number of beams across [-pi, pi]

relAngles = linspace(-builtin('pi'), builtin('pi'), nBeams);
ranges    = zeros(1,nBeams);
ds        = 0.15;   % step size along each ray

for k = 1:nBeams
    ang = theta + relAngles(k);
    r   = ds;
    while r < maxRange
        p = pos + r*[cos(ang); sin(ang)];
        if checkOccupancy(map, p') > 0.45
            break;          % hit a wall
        end
        r = r + ds;
    end
    ranges(k) = r;
end
end
