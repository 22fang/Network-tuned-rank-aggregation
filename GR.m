function r=GR(a,d,para);
%a is the input rank lists; Each column is a single rank list. Each element is the integer label of the gene. The label here and the label in the protein-rprotein interaction network have the same meaning.
%d is the protein-protein interaction network indicated by a matrix of two columns. Each row is a connected pair of nodes. The node is indicated by integer label. 
%para is the turning parameter of GeneRank
xx=max(d(:));
ppi=zeros(xx,xx);
ppi((d(:,2)-1)*xx+d(:,1))=1;
ppi=ppi+ppi';
ppi=ppi-diag(diag(ppi));
ppi_gene=[1:xx];

g=unique(a(:));
[d,e]=sort(a,1);
e=e./size(e,1);
e(find(e==1))=0.9999;
e=norminv(e,0,1);
[u,v,ind]=intersect(g,ppi_gene);
[u,ind1]=sort(v);
ind=ind(ind1);
r=zeros(size(e));
for i=1:size(a,2)
	p=zeros(size(ppi_gene));
	p(ind)=e(:,i);
	r0=p./sum(abs(e(:,i)));
	w=sum(ppi,2);
	w(find(w==0))=1;
	r1=(1-para)*p+para*ppi*(diag(w.^(-1)))*r0;
	x=max(abs(r0-r1));
	tx=0;
	while x>1e-6 && tx<1000
		r0=r1;
		r1=(1-para)*p+para*ppi*(diag(w.^(-1)))*r0;	
		x=max(abs(r0-r1));
		tx=tx+1;
	end
	r2=r1(ind);
	[u,ind2]=sort(r2); 
	r(:,i)=g(ind2);
end
