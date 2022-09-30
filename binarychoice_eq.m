function allattractors = binarychoice_eq(u,v)

syms r1 r2

solattractors=solve([4*r1^3+-8*r1*r2-u==0;4*r2^3+3*r2^2-4*r1^2+2*r2+v==0],[r1,r2]);
            
vector = find(sum(abs(imag(vpa([solattractors.r1,solattractors.r2]))),2)==0);
           
allattractors = double([vpa(solattractors.r1(vector)),vpa(solattractors.r2(vector))]);


end