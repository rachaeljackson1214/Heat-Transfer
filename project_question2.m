dx = 0.2;
distance = 0;
k = 16.2;
Xsur = 950;
Xinf = 30;
%A = 0.0126;
h = 95;
ep = 0.9;
sig = 5.67 * 10^ -8;
rho = 7930;
c = 0.5;
dt = 1;
timePassed = 0;
X = ones(1,10)*90;
X2 = zeros(1,10);
X5 = zeros(1,10);
X10 = zeros(1,10);
L = 0:0.2:1.8;
while X(10) < 850
    distance = distance + 0.2;
    %dx = dx + 0.2;
    %dt = dt + 1;
    %dt = dt+1;
    timePassed = timePassed + 1;
    for i=1:10
        if i == 1 
            X(i) = X(i)+(((2*k*dt)/(rho*c*dx^2))*(X(i+1)-X(i)))+((2*ep*sig*dt)/(rho*c*dx))*(((Xsur)^4)-((X(i)^4)));
        elseif i == 10 && distance > 1.7
            X(i) = X(i)+(((2*k*dt)/(rho*c*dx^2))*(X(i-1)-X(i)))+((2*ep*sig*dt)/(rho*c*dx))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 0.3 && distance < 0.5 && i < 3
            X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 0.5 && distance < 0.7 && i < 4
            X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 0.7 && distance < 0.9 && i < 5
            X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 0.9 && distance < 1.1 && i < 6
            X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 1.1 && distance < 1.3 && i < 7
            X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 1.3 && distance < 1.5 && i < 8
            X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 1.5 && distance < 1.7 && i < 9
            X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 1.7 && distance < 1.9 && i < 10
            X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
        elseif distance > 1.8
            if i == 1
                X(i) = X(i)+(((2*k*dt)/(rho*c*dx^2))*(X(i+1)-X(i)))+((2*ep*sig*dt)/(rho*c*dx))*(((Xsur)^4)-((X(i)^4)));
            elseif i == 10
                X(i) = X(i)+(((2*k*dt)/(rho*c*dx^2))*(X(i-1)-X(i)))+((2*ep*sig*dt)/(rho*c*dx))*(((Xsur)^4)-((X(i)^4)));
            else
                X(i) = X(i) + (((k*dt)/(rho*c*dx^2))*(X(i-1)-X(i))) + (((k*dt)/(rho*c*dx^2))*(X(i+1)-X(i))) + ((ep*sig*dt)/(rho*c*dx^2))*(((Xsur)^4)-((X(i)^4)));
            end
        end
    end    
end
A = X;
B = X;
C = X;
for time = 1:2
    for i=1:10
        if i == 1
            X2(i) = A(i)+(((2*k*dt)/(rho*c*dx^2))*(A(i+1)-A(i)))+(((2*h*dt)/(rho*c*dx))*(Xinf-A(i)));
        elseif i == 10
            X2(i) = A(i)+(((2*k*dt)/(rho*c*dx^2))*(A(i-1)-A(i)))+(((2*h*dt)/(rho*c*dx))*(Xinf-A(i)));
        else
            X2(i) = A(i) + (((k*dt)/(rho*c*dx^2))*(A(i-1)-A(i))) + (((k*dt)/(rho*c*dx^2))*(A(i+1)-A(i))) + (((h*dt)/(rho*c*dx^2))*(Xinf-A(i)));
        end   
    end
A = X2;
end
for time = 1:5
    for i=1:10
        if i == 1
            X5(i) = B(i)+(((2*k*dt)/(rho*c*dx^2))*(B(i+1)-B(i)))+(((2*h*dt)/(rho*c*dx))*(Xinf- B(i)));
        elseif i == 10
            X5(i) = B(i)+(((2*k*dt)/(rho*c*dx^2))*(B(i-1)-B(i)))+(((2*h*dt)/(rho*c*dx))*(Xinf- B(i)));
        else
            X5(i) = B(i) + (((k*dt)/(rho*c*dx^2))*(B(i-1)-B(i))) + (((k*dt)/(rho*c*dx^2))*(B(i+1)-B(i))) + (((h*dt)/(rho*c*dx^2))*(Xinf-B(i)));
        end   
    end
    B = X5;
end
for time = 1:10
    for i=1:10
        if i == 1
            X10(i) = C(i)+(((2*k*dt)/(rho*c*dx^2))*(C(i+1)-C(i)))+(((2*h*dt)/(rho*c*dx))*(Xinf-C(i)));
        elseif i == 10
            X10(i) = C(i)+(((2*k*dt)/(rho*c*dx^2))*(C(i-1)-C(i)))+(((2*h*dt)/(rho*c*dx))*(Xinf-C(i)));
        else
            X10(i) = C(i) + (((k*dt)/(rho*c*dx^2))*(C(i-1)-C(i))) + (((k*dt)/(rho*c*dx^2))*(C(i+1)-C(i))) + (((h*dt)/(rho*c*dx^2))*(Xinf-C(i)));
        end   
    end
    C = X10;
end


%plot(L,X)
%title('Temperature Distribution Within Rod')
%hold on
plot(L,A, '-or')
title('Temperature Distribution Within Rod')
hold on
plot(L,B, '-s');
plot(L,C, '-*')
legend({'t = 2 sec', 't = 5 sec', 't = 10 sec'})