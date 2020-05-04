function TA = compute(A)
    n = size(A, 1);
    TA = zeros(n);
    alpha = fliplr(poly(A));
    for i = 1:n
        TA(i, n+1-i) = 1;
        for j = 1:n-i
            TA(i, j) = alpha(i+j);
        end
    end
end