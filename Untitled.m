%% MNUM-PROJEKT, zadanie 1.21-Wojciech Rokicki 1AR
%% Wyznaczenie dokladnosci maszynowej komputera

x=0;
e=1;
while x~=1
    x=1;
    e=e/2;
    x=x+e;
end
%mnoze e przez 2 
disp(e*2);
%% Zadanie 2a

maxn=200;  %maxymalny rozmiar macierzy
normy=ones(maxn,1);


for m=1:maxn
    n=m;
    A=ones(n);
    b=ones(n,1);
    x=ones(n,1);
    for i=1:n
        b(i,1)=0.5+2.5*i;
        for j=1:n
            if i==j
                A(i,j)=10;
            elseif (i==j-1)||(i==j+1)
                A(i,j)=3;
            else
                A(i,j)=0;
            end
        end
    end
    
    disp(A);
    disp(b);
    
    U=A;         %gornej macierzy przypisujemy macierz poczatkowa
    L=eye(n);    %dolna inicjalizujemy jedynkami na diagonali
    pom=2;       %zmienna pomocnicza
    for j=1:n    %przejscie kolejno po kazdej kolumnie
        max=0; %zerujemy warto?? maksymaln?
        poz=j; %ustawiamy poczatkowa pozycje (1. wiersz) na k-ty (tutaj j-ty) krok
        for x=j:n %przechodzimy po wszystkich wspolczynnikach ponizej pierwszego w j-tym kroku wlacznie
            if abs(U(x,j))>abs(max) %porownujemy moduly zapamietanej max wartosci z bierzacym wspolczynnikiem
               max=U(x,j); %jesli element byl wiekszy to zapamietujemy jego wartosc...
               poz=x; %... i pozycje
            end
        end
        U([j poz],:)=U([poz j],:); %zamieniamy wiersze (1. z tym gdzie wystapila najwieksza wartosc bezwzgledna)
        b([j poz],1)=b([poz j],1);
        for i=pom:n             %obliczamy ilorazy, modyfikujemy wiersze
            L(i,j)=U(i,j)/U(j,j);
            U(i,:)=U(i,:)-(L(i,j)*U(j,:));
            b(i,1)=b(i,1)-(L(i,j)*b(j,1));
        end
        pom=pom+1;
    end
    
    %Obliczanie wyniku
    x(n,1)=b(n,1)/U(n,n); %Obliczenie ostatniego wyniku
    
    for z=n-1:-1:1
        x(z,1)=(b(z,1)-U(z,z+1:n)*x(z+1:n,1))/U(z,z);
    end
    
    %disp(A);
    
    disp(x);
    
    %disp(U);
    
    %disp(L);
    
    %disp(L*U);
    
    %disp(U*x);
    
    %disp(b);
    
    %Norma z residuum
    r=U*x-b;
    %disp(r);
    norma=norm(r);
    
    normy(m,1)=norma;
    
    %Bez uzywania funkcji norm
    %norma=0;
    %for z=1:n
    %   norma=norma+pow2(abs(r(z,1))); 
    %end
    %norma=sqrt(norma);
    %disp(norma);
    
end

disp(normy);

plot(1:maxn,normy);
%% Zadanie 2b

for m=1:maxn
    n=m;
    A=ones(n);
    b=ones(n,1);
    for i=1:n
        b(i,1)=3.5-0.4*i;
        for j=1:n
            if i==j
                A(i,j)=1/4;
            else
                A(i,j)=3*(i-j)+4;
            end
        end
    end
    
    disp(A);
    disp(b);
    
    U=A;
    L=eye(n);
    pom=2;
    for j=1:n
        
        max=0; %zerujemy warto?? maksymaln?
        poz=j; %ustawiamy poczatkowa pozycje (1. wiersz) na k-ty (tutaj j-ty) krok
        for x=j:n %przechodzimy po wszystkich wspolczynnikach ponizej pierwszego w j-tym kroku wlacznie
            if abs(U(x,j))>abs(max) %porownujemy moduly zapamietanej max wartosci z bierzacym wspolczynnikiem
               max=U(x,j); %jesli element byl wiekszy to zapamietujemy jego wartosc...
               poz=x; %... i pozycje
            end
        end
        
        U([j poz],:)=U([poz j],:); %zamieniamy wiersze (1. z tym gdzie wystapila najwieksza wartosc bezwzgledna)
        b([j poz],1)=b([poz j],1);
        
        for i=pom:n
            L(i,j)=U(i,j)/U(j,j);
            U(i,:)=U(i,:)-(L(i,j)*U(j,:));
            b(i,1)=b(i,1)-(L(i,j)*b(j,1));
        end
        pom=pom+1;
    end
    
    %Obliczanie wyniku
    x(n,1)=b(n,1)/U(n,n); %Obliczenie ostatniego wyniku
    
    for z=n-1:-1:1
        x(z,1)=(b(z,1)-U(z,z+1:n)*x(z+1:n,1))/U(z,z);
    end
    
    disp(x);
    
    %Norma z residuum
    r=U*x-b;
    norma=norm(r);
    
    normy(m,1)=norma;
    
end

disp(normy);

plot(1:maxn,normy);
%% Zadanie 2c

for m=1:maxn 
    n=m;
    A=ones(n);
    b=ones(n,1);
    for i=1:n
        b(i,1)=5/(3*i);
        for j=1:n 
            A(i,j)=1/(2*(i+j+1));
        end
    end
    
    disp(A);
    disp(b);
    
    U=A;
    L=eye(n);
    pom=2;
    for j=1:n
        
        max=0; %zerujemy warto?? maksymaln?
        poz=j; %ustawiamy poczatkowa pozycje (1. wiersz) na k-ty (tutaj j-ty) krok
        for x=j:n %przechodzimy po wszystkich wspolczynnikach ponizej pierwszego w j-tym kroku wlacznie
            if abs(U(x,j))>abs(max) %porownujemy moduly zapamietanej max wartosci z bierzacym wspolczynnikiem
               max=U(x,j); %jesli element byl wiekszy to zapamietujemy jego wartosc...
               poz=x; %... i pozycje
            end
        end
        
        U([j poz],:)=U([poz j],:); %zamieniamy wiersze (1. z tym gdzie wystapila najwieksza wartosc bezwzgledna)
        b([j poz],1)=b([poz j],1);
        
        for i=pom:n
            L(i,j)=U(i,j)/U(j,j);
            U(i,:)=U(i,:)-(L(i,j)*U(j,:));
            b(i,1)=b(i,1)-(L(i,j)*b(j,1));
        end
        pom=pom+1;
    end
    
    %Obliczanie wyniku
    x(n,1)=b(n,1)/U(n,n); %Obliczenie ostatniego wyniku
    
    for z=n-1:-1:1
        x(z,1)=(b(z,1)-U(z,z+1:n)*x(z+1:n,1))/U(z,z);
    end
    
    disp(x);
    
    %Norma z residuum
    r=U*x-b;
    %disp(r);
    norma=norm(r);
    
    normy(m,1)=norma;
    
end

disp(normy);

    plot(1:maxn,normy);
%% Zadanie 3

A=[-7, 1, 1, 1; 1, 11, -5, 2; 2, 3, 16, -3; 1, 2, -6, -15]
b=[3; 17; 9; -26]
x=[1;1;1;1];
xi=ones(4,1);
e=0.0001;
L=zeros(4);
D=zeros(4);
U=zeros(4);
for i=1:4
    for j=1:4
        if(i==j)
            D(i,j)=A(i,j);
        end
        if(i>j)
           L(i,j)=A(i,j); 
        end
        if(i<j)
            U(i,j)=A(i,j);
        end
    end
end
i=1;
while(1)
xi=-inv(D)*(L+U)*x+inv(D)*b;
if norm(xi-x)<e     %Je?li norma zeuklidesowa roznicy miedzy kolejnymi przyblizeniami rozwiazania
    break           %jest mniejsza od zadanego bledu przyblizenia to przerwij petle
end
i=i+1;      %zliczanie iteracji potrzebnych do zrealizowania przyblizenia
x=xi;
end
disp(A);
disp(b);
disp(xi);
disp(i);
%% Zastosowanie Jacobiego do poprzedniego zadania

n=5;
    A=ones(n);
    b=ones(n,1);
    for i=1:n
        b(i,1)=0.5+2.5*i;
        for j=1:n
            if i==j
                A(i,j)=10;
            elseif (i==j-1)||(i==j+1)
                A(i,j)=3;
            else
                A(i,j)=0;
            end
        end
    end
    x=ones(n,1);
    xi=ones(n,1);
    e=0.0001;
L=zeros(n);
D=zeros(n);
U=zeros(n);
for i=1:n
    for j=1:n
        if(i==j)
            D(i,j)=A(i,j);
        end
        if(i>j)
           L(i,j)=A(i,j); 
        end
        if(i<j)
            U(i,j)=A(i,j);
        end
    end
end
disp(A);
disp(L);
disp(D);
disp(U);
i=1;
while(1)
xi=-inv(D)*(L+U)*x+inv(D)*b;
if norm(xi-x)<e     %Je?li norma zeuklidesowa roznicy miedzy kolejnymi przyblizeniami rozwiazania
    break           %jest mniejsza od zadanego bledu przyblizenia to przerwij petle
end
i=i+1;      %zliczanie iteracji potrzebnych do zrealizowania przyblizenia
x=xi;
end
disp(A);
disp(b);
disp(xi);
disp(i);