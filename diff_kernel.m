function d=diff_kernel(l,para)
%l is the laplacian matrix of the protein-protein interaction network.para is the tuning parameter.
d=expm(-para*l);
w=diag(d);
w=w.^0.5;
d=d./(w*ones(1,size(d,2)));
d=d./(ones(size(d,1),1)*w');
