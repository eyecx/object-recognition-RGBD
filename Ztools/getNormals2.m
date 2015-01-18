function [N, dN_Z, n1, n2] = getNormals2(Z)

getFilters2

n1 = conv2(Z, f1m, 'valid');
n2 = conv2(Z, f2m, 'valid');
N3 = 1./sqrt(n1.^2 + n2.^2 + 1);

N1 = n1 .* N3;
N2 = n2 .* N3;

N = cat(3, N1, N2, N3);

if nargout >= 2
  
  N123 = -(N1.*N2.*N3);
  N3sq = N3.^2;

  dN_Z.F1_1 = (1 - N1.*N1).*N3;
  dN_Z.F1_2 = N123;
  dN_Z.F1_3 = -N1.*N3sq;
  
  dN_Z.F2_1 = N123;
  dN_Z.F2_2 = (1 - N2.*N2).*N3;
  dN_Z.F2_3 = -N2.*N3sq;

  dN_Z.f1 = f1;
  dN_Z.f2 = f2;
  
end

