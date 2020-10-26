function res=extractionMaxLocal(gradV,gradH,grad)
res=grad;
[row,col]=size(grad);
 
for i1=2:row-1
for j1=2:col-1
 
	if gradV(i1,j1)>gradH(i1,j1)
		gradM1=gradH(i1,j1)/gradV(i1,j1)*grad(i1-1,j1)  + (gradV(i1,j1)-gradH(i1,j1))/gradV(i1,j1)*grad(i1-1,j1+1) ;
		gradM2=gradH(i1,j1)/gradV(i1,j1)*grad(i1+1,j1-1)  + (gradV(i1,j1)-gradH(i1,j1))/gradV(i1,j1)*grad(i1+1,j1) ;
	end
 
	if gradH(i1,j1)>gradV(i1,j1)
		gradM1=gradV(i1,j1)/gradH(i1,j1)*grad(i1,j1+1)  + (gradH(i1,j1)-gradV(i1,j1))/gradH(i1,j1)*grad(i1-1,j1+1) ;
		gradM2=gradV(i1,j1)/gradH(i1,j1)*grad(i1,j1-1)  + (gradH(i1,j1)-gradV(i1,j1))/gradH(i1,j1)*grad(i1+1,j1) ;
	end
 
	%condition pour que le pixel ne soit pas un maximum local dans l'image
	if grad(i1,j1)>gradM1 && grad(i1,j1)>gradM2
	   res(i1,j1)=res(i1,j1);
	  else
	   res(i1,j1)=0;
	end
end
end
function [ output_args ] = Untitled3( input_args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


end

