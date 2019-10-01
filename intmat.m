function intmat = intmat(n,l,f,nu)
    
    intmat = zeros(n+1);
    
    %exponential gaussian proc
    if f == 1
        for i = 0:n
            for j = 0:n
                intmat(i+1,j+1) = exp(-abs(i-j)/(n*l))/n;
                if j == 0
                    intmat(i+1,j+1) = intmat(i+1,j+1)/2;
                elseif j == n
                    intmat(i+1,j+1) = intmat(i+1,j+1)/2;
                end
            end
        end
    %square exponential gaussian proc
    elseif f == 2
        for i = 0:n
            for j = 0:n
                intmat(i+1,j+1) = exp(-(i-j)^2/(n^2*l))/n;
                if j == 0
                    intmat(i+1,j+1) = intmat(i+1,j+1)/2;
                elseif j == n
                    intmat(i+1,j+1) = intmat(i+1,j+1)/2;
                end
            end
        end
    %general kernel
    elseif f == 3
        for i = 0:n
            for j = 0:n
                if i ~= j
                    intmat(i+1,j+1) = 2^(1-nu)/gamma(nu)*(abs(i-j)/l)^nu*besselk(nu,abs(i-j)/l)/n;
                else
                    intmat(i+1,j+1) = 1/n;
                end
                
                if j == 0
                    intmat(i+1,j+1) = intmat(i+1,j+1)/2;
                elseif j == n
                    intmat(i+1,j+1) = intmat(i+1,j+1)/2;
                end
            end
        end
    end
end