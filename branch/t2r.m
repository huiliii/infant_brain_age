function [r] = t2r(t,df)

r= sign(t)*sqrt(t^2/(t^2+df));