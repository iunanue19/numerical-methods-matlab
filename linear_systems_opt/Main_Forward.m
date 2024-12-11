%COMPROBATION

%FORWARD SUBSTITUTION OPTIMIZATION

l = [1, 0, 0;
     0.5, 1, 0;
    -0.5, 1, 1];
c = [2; 4; 5];

x = forward_substitution_opt(l, c);
disp('Solution x:');
disp(x);
