function [ dpsi ] = getPsiDifference( psi1,psi2 )
    %GETPSIDIFFERENCE Summary of this function goes here
    %   Detailed explanation goes here
    a = abs(psi1-psi2);
    b = 2*pi - abs(psi1-psi2);
    dpsi = min(a,b);
end

