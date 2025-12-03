function v_wall = lidarWallRepulsion(theta, relAngles, ranges, repRange)
% lidarWallRepulsion: compute wall repulsion vector from LiDAR

v_wall = [0;0];
for k = 1:length(relAngles)
    r = ranges(k);
    if r < repRange
        ang = theta + relAngles(k);
        dirObs = [cos(ang); sin(ang)];
        strength = (repRange - r)/repRange;
        v_wall = v_wall - strength * dirObs;  % push away from wall
    end
end
if norm(v_wall) > 1e-6
    v_wall = v_wall / norm(v_wall);
end
end
