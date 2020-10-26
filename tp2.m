close all, clear all
f= imread('images_TP1/fleur.png');n=size(f,1);
figure(1);
f1=cat(3,f(:,:,1),zeros(n), zeros(n));
f2=cat(3,zeros(n),f(:,:,2), zeros(n));
f3=cat(3,zeros(n), zeros(n),f(:,:,3));
subplot(2,2,1);imshow(f);title('image fleur');
subplot(2,2,2);imshow(f1);title('composante rouge');
subplot(2,2,3);imshow(f2);title('composante verte');
subplot(2,2,4);imshow(f3);title('composante bleue');

NR=zeros(n);
seuil=0;
for i=1:n
    for j=1:n
       if (f(i,j,1)>f(i,j,2)+seuil & f(i,j,1)>f(i,j,3)+seuil )
        NR(i,j)=1;
       end
    end
end


NB=zeros(n);
for i=1:n
    for j=1:n
       if (f(i,j,2)>f(i,j,1)+seuil & f(i,j,2)>f(i,j,3)+seuil )
        NB(i,j)=1;
       end
    end
end


NG=zeros(n);
for i=1:n
    for j=1:n
       if (f(i,j,3)>f(i,j,2)+seuil & f(i,j,3)>f(i,j,1)+seuil )
        NG(i,j)=1;
       end
    end
end


figure(2);
subplot(1,3,1);imshow(NR);title('binarisation rouge')
subplot(1,3,2);imshow(NB);title('binarisation Bleu')
subplot(1,3,3);imshow(NG);title('binarisation vert')


grayIm=rgb2gray(f);
imWrite(grayIm,'imgage gray.png')
figure(3)
imshow(grayIm);








