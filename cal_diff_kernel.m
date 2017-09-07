function d=cal_diff_kernel(a,para)
%a is the protein-protein interaction network. The format of a is a two columns matrix. Each row of the matrix indicate a pair of connected nodes in the protein-protein interaction network. The nodes are indicated by integer label.
%para is the vecter for the tuning parameter. 
b=max(a(:));
ppi=zeros(b,b);
ppi(b*(a(:,2)-1)+a(:,1))=1;
ppi=ppi-diag(diag(ppi));
ppi=ppi+ppi';
w=sum(ppi,2);
l=diag(w)-ppi;
d=diff_kernel(l,para);
