function p=CGI(a,ppi,ppi_gene,lan);
%a is the matrix input rank lists, each column is a single rank list. In each rank list, the gene is indicate by integer label 
%ppi is the diffusion kernel score matrix 
%ppi_gene is the map between gene id in the ppi (diffusion kernel matrix) and a (input rank lists). It is a matrix with two columns. The first column is the integer id of gene in ppi, the second column is the corresponding integer id of gene in the diffusion kernel matrix.
%lan is the tuning parameter in CGI. 
b=a;
c=unique(b(:));
[d,e]=sort(b,1);
[u,v,ind]=intersect(c,ppi_gene(:,2));
[u,ind1]=sort(v);
ind=ind(ind1);
f=ppi(ppi_gene(ind,1),ppi_gene(ind,1));
f=f-diag(diag(f));
e=e./size(e,1);
e(find(e==1))=0.9999;
e=norminv(e,0,1);
e2=-1*abs(e);
e1=e+lan*f*e2;
e1=e1./((1+lan*sum(f,2))*ones(1,size(b,2)));
[h,g]=sort(e1,1);
p=c(g);
