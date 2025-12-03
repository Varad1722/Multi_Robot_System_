function ang = wrapToPi_local(ang)
% wrapToPi_local: wrap angle to (-pi, pi]

ang = mod(ang + builtin('pi'), 2*builtin('pi')) - builtin('pi');
end
