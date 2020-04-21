function [out1, out2] = theor4(lambda, b)
i = 1;
for j = 1:b
    st = j-1;
            p(1,j) = ((lambda^st)/factorial(st))*exp(-lambda);
end;
p(2,:) = p(1,:);
j = 1;
for i = 3:b
            p(i,:) = [zeros(1, i-2) p(1,1:b-j)];
            j = j + 1;
end;
tmp = p' - eye(length(p));
tmp(b,:) = ones(1,length(p));
tmp = tmp^-1;
res = zeros(length(p), 1);
res(length(p), 1) = 1;
tmp = tmp * res;
N = 0;
for i = 0:(b-1)
    N = N + (i * tmp(i+1));
end;

d = N/lambda;
out1 = d;
out2 = N;