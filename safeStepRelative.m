function ok = safeStepRelative(candidatePos, poses, iSelf, safetyCircle)
% safeStepRelative: avoid stepping closer than safetyCircle to neighbors

ok = true;
pos_now = poses(1:2,iSelf);
for j = 1:size(poses,2)
    if j == iSelf
        continue;
    end
    pos_j = poses(1:2,j);
    d_now = norm(pos_now   - pos_j);
    d_new = norm(candidatePos - pos_j);
    if d_new < safetyCircle && d_new < d_now
        ok = false;
        return;
    end
end
end
