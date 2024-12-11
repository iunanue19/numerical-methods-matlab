function x = backward_substitution(u, d)
    % Optimized backward substitution to solve Ux = d

    % Ensure d is a column vector
    d = d(:);
    [n, m] = size(u);

    % Validate inputs
    if n ~= m
        error('Matrix "u" must be square.');
    end

    if length(d) ~= n
        error('Vector "d" must have the same length as the dimension of "u".');
    end

    % Preallocate solution vector
    x = zeros(n, 1);

    % Perform backward substitution
    for i = n:-1:1
        % Check for singularity
        if u(i, i) == 0
            error('Matrix "u" is singular at row %d.', i);
        end

        % Compute x(i) and update d inline
        x(i) = d(i) / u(i, i);
        d(1:i-1) = d(1:i-1) - u(1:i-1, i) * x(i);
    end

    % Match the orientation of d (row or column vector)
    if isrow(d)
        x = x.';
    end
end
