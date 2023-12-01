A = input('Enter matrix A (in the format "[a11, a12; a21, a22]"): ');

B = input('Enter matrix B (in the format "[b11, b12; b21, b22]"): ');

disp('Matrix A:');
disp(A);

disp('Matrix B:');
disp(B);

max_value_A = max(max(A));
fprintf('The maximum value in matrix A is: %d\n', max_value_A);

[mA, nA] = size(A);
[mB, nB] = size(B);

if nA ~= mB
    fprintf('Matrix multiplication is not possible due to incompatible dimensions.\n');
else
    result_matrix = A * B;
    disp('Result of A * B:');
    disp(result_matrix);
end

