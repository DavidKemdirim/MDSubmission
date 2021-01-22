function [ output_args ] = AddParticleStream(num, x0, y0, PartAng, Type, Ep, Seper)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 nAtoms

if Type == 0
    Mass = Mass0;
else
    Mass = Mass1;
end


for p = 0:num - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * 0.1*p*cos(PartAng);
    y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing/2 * sin(PartAng);
    AtomType(nAtoms) = Type;
end

V = sqrt(2 * Ep / Mass);

for p = 1:num
    
    if mod(p,2) == 0
        changAng = 0.1;
    else 
        changAng = -0.1;
    end 
    
    Vx(nAtoms - num + p) = 1.5 * V * cos(PartAng+changAng);
    Vy(nAtoms - num + p) = 1.5 * V * sin(PartAng);
end

end
