function [classes, moys] = kmoyennes(X,k)
% k_moyennes : calcule la classification de X par la methode des k-means
% Entrees : 
%   X : donnees, de taille nbre echantillons x nbre de variables
%   k : nombre de classes
% Sorties :
%   classes : resultat de la classification. Vecteur de taille size(X,1) x
%   1, l'element j appartenant à la classe numero classes(j), avec j=1..k
%   moys : moyennes des classes (taille k x s)

[N, p] = size(X);
classes = zeros(N,1);

% initialisation des k barycentres : aléatoire uniforme
moys = 255*rand(k,p);
moys_old = moys+1;

cpt = 0;
tmp = zeros(N,k);

while (norm(moys-moys_old,'fro')>0.01) && cpt < 100 % tant que les barycentres bougent
    
    % Calculer les distances aux barycentres
    for j=1:k
        tmp(:,j) = sum((X-ones(N,1)*moys(j,:)).^2,2);
    end
    % Calculer les classes
    [~, classes] = min(tmp,[],2);
        
   % Mise à jour des moyennes de chaque classe 
    for i=1:k
        % A COMPLETER!
        
    end
    
    % Teste si une classe est vide. SI oui, réinitialise le barycentre
    % concerné
    idx = find(isnan(sum(moys,2)));
    moys(idx,:) = 255*rand(length(idx),p);
    
    cpt = cpt+1;
end

disp([num2str(cpt) 'iterations']);

end
