function [its,eigs] = eigfct(mat)

    eigs = sort(eig(mat),'descend');
    len = length(eigs);
    if min(eigs) <= 0
        error('non-positive eigenvalues')
    end
    sum = 0;
    for i = 1:len
        sum = sum + eigs(i);
        if sum > 0.95
            its = i;
            return;
        end
    end
end