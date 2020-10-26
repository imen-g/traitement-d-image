clear all;
close all;
X= imread('coins1.png');
% imshow(x);
%imhist(X);
for i=1:246
    for j=1:300
        if(X(i,j)>82)
            X_bin(i,j)=1;
        else
            X_bin(i,j)=0;
        end
    end
end
% imshow(X_bin);
% [v,seuil]=Otsu(X);
X_2= imread('coins2.png');
%n=size(X1);
n1=0;
m1=0;
% imshow(X_2);
for i=1:5
 
[w,seuil2]=Otsu(X_2(n1:m1);
[n,m]=size(X_2);
for i=1:n
    for j=1:m
        if(X_2(i,j)>seuil2)
            X_bin_2(i,j)=1;
        else
            X_bin_2(i,j)=0;
        end
    end
end
n1=n1+50;
m1=m1+50;
end
