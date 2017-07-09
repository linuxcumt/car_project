function [ X,Y ] = removeEmptyElements( X,Y )
%REMOVEEMPTYELEMENTS Summary of this function goes here
%   Detailed explanation goes here
    ind = [];
    for j=1:length(X)
       if (X(j)==0 && Y(j)==0)
           ind = [ind j];
       end
    end
    X(ind) = []; Y(ind) = [];
end

