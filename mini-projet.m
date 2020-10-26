close all, clear all
%------------- question 1------------------------------------------------
 n=400;m=470;
 img=ones(m,n); %génération de l'mage noire
 %génération du croix en haut de l'mage
 for i=1:30
    img(i,370+i)=160; 
     img(i,400-i)=160;
 end 
 figure(1)
 imshow(uint8(img));
 title('Image synthétisée');
%----------------------------------------------------------------------

%-------------question 2 ----------------------------------------------

x= imread('image6.jpg'); %lecture de l'image
grayIm=rgb2gray(x); %convertion de l'image en niveaux de gris
% val_max=max(grayIm(:)); %pour verifier que l'image est bien codée 
%                         %sur 8 bits(c'est à dire le max<=255)
 figure(2)
 imshow(grayIm);
 title('Image naturelle en niveaux de gris');

%----------------------------------------------------------------------

%--------- question 3--------------------------------------------------
[n,m]=size(grayIm);
grayIm_uint6=grayIm;

for i=1:n
    for j=1:m
        if(grayIm(i,j)>63)
            grayIm_uint6(i,j)=63;
        end
    end
end
 figure(3)
 imshow(grayIm_uint6);
 

figure(4)
subplot(2,1,1)
hist(double(grayIm));
hold on
subplot(2,1,2)
hist(double(grayIm_uint6))

%affichage de la valeur abs de - entre les deux images
figure(5)
imshow(abs(grayIm_uint6-grayIm))
title('Valeur absolue de la différence entre l image originale renormalisée et l image quantifiée renormalisée')
%----------------------------------------------------------------------

%-------------question 4 --------------------------------------------
[M1,M2]=size(grayIm);
M=M1*M2;
C=0.0001;
Z_freq=abs(fftshift(fft2(grayIm)/M));
% Z_freqlog=10*log10(C+abs(fftshift(fft2(grayIm)/M))); %transformé de
                                    % forier en echelle logarithmique

figure(6)
imshow(Z_freq)
title('le module de la transformée de Fourier en échelle linéaire');
imshow(Z_freqlog)
title('le module de la transformée de Fourier en échelle logarithmique');
% %--------------------------------------------------------------------------
% 
% %------------------Question 5----------------------------------------------
p=0.5;
X2=imnoise(grayIm,'salt & pepper',p);%applique un bruit sel et poivrede percentage p

 figure(7)
 imshow(X2)
 title('image bruité')

h=fspecial('gaussian',21,4);% definition du filtre gaussien

% %autre filtre :
%h=fspecial('average',21);% definition du %filtre moyenneur
%h=fspecial('gaussian',21,0.25);% definition du filtre gaussien d'écart-type=0.25

 im_fil=imfilter(grayIm,h);
 figure(8)
 imshow(im_fil)
 title('image filtré')

 %Calcul de PSNR:
 [M1,M2]=size(grayIm);
 %EQM : Erreur Quadratique Moyenne
 EQM=sum((double(grayIm(:)-im_fil(:)).^2)/(M1*M2));
 %PSNR: Peak Signal-Noise Ratio
 PSNR = 10*log10(255*255/EQM)
% %--------------------------------------------------------------------------
% 
% %---------------------- Question 6 ----------------------------------------
%filtre gradient
h1=[1 -1];

%filtre de Sobel
%h1=[1 2 ,0 0 0, -1 -2 -1];
%h1=[2 1 0,1 0 -1,0 -1 -2]; %autre filtre de Sobel

%filtre LOG
%h1=fspecial('log',15,1); %filtre LOG d'ordre 15 et de variance 1
%h1=fspecial('log',5,1);  %filtre LOG d'ordre 5 et de variance 1
% h1=fspecial('log',15,0.75); %filtre LOG d'ordre 15 et de variance 0.75

 y_log=imfilter(grayIm,h1');
 figure(9)
 imshow(mat2gray(abs(y_log)));
 title('Image filtrée mettant en évidence les contours');
%--------------------------------------------------------------------------

%----------------Question 7 -----------------------------------------------
 figure(10)
 imshow(x);
 title('image couleur originale');





















