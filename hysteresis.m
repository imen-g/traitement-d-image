function res=hysteresis(Ibas,Ihaut)
res=Ihaut;
 
[row,col]=size(res);
 
count = 1; k=0; MAXITERATION = 200;
while ( ( count ~= 0 ) && ( k < MAXITERATION ) )
count = 0;
 
for i1=2:row-1
for j1=2:col-1
 
	if(res(i1,j1)>0)
 
	 	if(Ibas(i1-1,j1-1)>0)
	 	  res(i1-1,j1-1)=1; count=count + 1;
	 	  end
 
	 	if(Ibas(i1-1,j1)>0)
	 	  res(i1-1,j1)=1; count=count + 1;
	 	 end
 
	 	 if(Ibas(i1-1,j1+1)>0)
	 	  res(i1-1,j1+1)=1; count=count + 1;
	 	  end
 
	 	  if(Ibas(i1,j1-1)>0)
	 	  res(i1,j1-1)=1; count=count + 1;
	 	  end
 
 
	 	  if(Ibas(i1,j1+1)>0)
	 	  res(i1,j1+1)=1;  count=count + 1;
	 	  end
 
 
	 	  if(Ibas(i1+1,j1-1)>0)
	 	  res(i1+1,j1-1)=1;  count=count + 1;
	 	  end
 
 
	 	  if(Ibas(i1+1,j1)>0)
	 	  res(i1+1,j1)=1;  count=count + 1;
	 	  end
 
 
	 	  if(Ibas(i1+1,j1+1)>0)
	 	  res(i1+1,j1+1)=1; count=count + 1;
	 	  end
 	  end
end
end
 
k = k + 1;
end
