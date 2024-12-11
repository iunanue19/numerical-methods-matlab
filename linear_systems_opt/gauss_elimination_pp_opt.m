function a = gauss_elimination_pp(a, b)
    % Optimized Gaussian Elimination with Partial Pivoting.
    %
    % Args:
    %     a: Coefficient matrix A from system Ax = b (n x n).
    %     b: Column vector b (n x 1) from the system.
    %
    % Returns:
    %     a: Augmented upper triangular matrix [U | c], where U is upper triangular.

    [n, m] = size(a);

    % Validate inputs
    if n ~= m
        error('Matrix "a" must be square.');
    end

    if length(b) ~= n
        error('Vector "b" must have the same number of rows as matrix "a".');
    end

    % Augment the matrix
    a = [a, b(:)];

    % Elimination process
    for i = 1:n-1
        % Partial pivoting: Find the row with the maximum absolute value in column i
        [~, pivot] = max(abs(a(i:n, i)));
        pivot = pivot + i - 1;

        if a(pivot, i) == 0
            warning('Matrix is singular or nearly singular. No unique solution.');
            return;
        end

        % Swap rows if needed
        if pivot ~= i
            a([i, pivot], :) = a([pivot, i], :);
        end

        % Perform elimination on rows below pivot
        for j = i+1:n
            factor = a(j, i) / a(i, i);
            a(j, i:end) = a(j, i:end) - factor * a(i, i:end);
        end
    end

    % Check for singularity in the last diagonal entry
    if a(n, n) == 0
        warning('Matrix is singular or nearly singular. No unique solution.');
    end
end
