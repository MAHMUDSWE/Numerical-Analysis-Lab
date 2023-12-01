function y = f(x)
    y = x.^3 - 6*x.^2 + 11*x - 6.1;
endfunction

function [roots, iterations] = false_position_method(a, b, tol, max_iterations)
    roots = [];
    iterations = [];

    if (f(a) * f(b)) > 0
        error('The function has the same sign at both interval endpoints. False-position method cannot proceed.');
    end

    for i = 1:max_iterations
        c = (a*f(b) - b*f(a)) / (f(b) - f(a));
        roots = [roots; c];
        iterations = [iterations; i];

        if abs(f(c)) < tol
            break;
        end

        if f(c) * f(a) < 0
            b = c;
        else
            a = c;
        end
    end
endfunction

a = 0;
b = 4;
tolerance = 1e-6;
max_iterations = 50;

[roots, iterations] = false_position_method(a, b, tolerance, max_iterations);

x = linspace(0, 4, 1000);
y = f(x);
plot(x, y, 'LineWidth', 1.5);
hold on;

scatter(roots, f(roots), 'r', 'filled');
text(roots, f(roots), num2str(iterations), 'VerticalAlignment','bottom', 'HorizontalAlignment','right');

xlabel('x');
ylabel('f(x)');
title('False-Position Method for Root Finding');
grid on;
legend('f(x)', 'Roots');
