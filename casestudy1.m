% Geometry
W = 1 ;
H = 1 ;
Nx = 101 ;
Ny = 101 ;
dx = W/(Nx-1) ;
dy = H/(Ny-1) ;

% Boundary Condition
T = 25*ones(Nx,Ny);

T(1,2:Ny-1) = 120 ;
T(Nx,2:Ny-1) = 40 ;
T(2:Nx-1,1) = 40 ;
T(2:Nx-1,Ny) = 40 ;

T(1,1) = (120+40)/2 ;
T(Nx,1) = (40+40)/2 ;
T(1,Ny) = (120+40)/2 ;
T(Nx,Ny) = (40+40)/2 ;

% Computation
Epsilon = 1e-5 ;
Error = 5 ;
Iter = 0 ;
while (Error>Epsilon)
    Iter = Iter +1 ;
    disp(Iter);
    Told = T ;
    for i  = 2:Nx-1
        for j = 2:Ny-1
            T(i,j) = (T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))/4 ;
        end
    end
    Error = sqrt(sumsqr(T-Told)) ;
    disp(Error) ;
end

% Plotting
x = 0:dx:W ;
y = 0:dy:H ;
colormap("jet");
contourf(x,y,T') ;
title('Tempreture Distributation') ;
xlabel ('Width (in m)') ;
ylabel ('Height (in m)') ;