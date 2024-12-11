function x = forward_substitution(l, c)
    % Optimized forward substitution to solve Lx = c

    % Ensure c is a column vector
    c = c(:);
    [n, m] = size(l);

    % Validate inputs
    if n ~= m
        error('Matrix "l" must be square.');
    end

    if length(c) ~= n
        error('Vector "c" must have the same length as the dimension of "l".');
    end

    % Preallocate solution vector
    x = zeros(n, 1);

    % Perform forward substitution
    for i = 1:n
        % Check for singularity
        if l(i, i) == 0
            error('Matrix "l" is singular at row %d.', i);
        end

        % Compute x(i) and update c inline
        x(i) = c(i) / l(i, i);
        c(i+1:n) = c(i+1:n) - l(i+1:n, i) * x(i);
    end

    % Match the orientation of c (row or column vector)
    if isrow(c)
        x = x.';
    end
end
