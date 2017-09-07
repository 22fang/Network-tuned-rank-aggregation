endeavour <- function(rx){
# rx is the rank matrix, each column is a single rank list. Each item in the rank list is a integer label.
x=nrow(rx)
y=ncol(rx)
q=array(0,dim=c(x,1))
c=sort(rx[,1])
de=apply(rx,2,sort,FALSE,index.return=TRUE);
ry=array(0,dim=c(x,y))
for (i in 1:y){
        ry[,i]=de[[i]]$ix
}
ry=ry/x;



for (k in 1:x){
	r=sort(ry[k,])
	v=array(0,dim=c(length(r)+1,1))
	v[1]=1;
	v1=array(0,dim=c(length(v)-1,length(v)-1))
	v2=array(0,dim=c(length(v)-1,length(v)-1))
	for (i in 1:length(v)-1){
		for (j in 1:i){
			v1[i,j]=r[length(r)-i+1]^(i-j+1)/factorial(i-j+1)
			v2[i,j]=(-1)^(i-j)
		}
	}
	for (i in 1:length(r)){
		p=v[1:length(r)]
		qx=array(1,dim=c(1,length(r)))
		y=p%*%qx
		z=v1
		x=z*t(y)
		v[2:(length(r)+1)]=apply(v2*x,1,sum)
	}
	q[k]=v[length(v)]*factorial(length(r))
}

v=sort(q,index.return=TRUE);
w=c[v$ix];
return(w);

}
