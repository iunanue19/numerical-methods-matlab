%COMPROBATION

%BACKWARD SUBSTITUTION OPTIMIZATION

u = augmented_matrix(:, 1:3);
d = augmented_matrix(:, 4);

% Backward substitution
x = backward_substitution_opt(u, d);
disp('Solution x:');
disp(x);
