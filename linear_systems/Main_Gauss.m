a = [2, -1, 1;
     4, 1, -2;
    -2, 2, 1];
b = [1; 7; -1];

% Gaussian elimination
augmented_matrix = gauss_elimination_pp(a, b);
disp('Augmented matrix [U | c]:');
disp(augmented_matrix);

