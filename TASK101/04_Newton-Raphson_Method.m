function y = f(x)
    y = x.^3 - 6*x.^2 + 11*x - 6.1;
endfunction

function y = df(x)
    y = 3*x.^2 - 12*x + 11;
endfunction

function [roots, iterations, tangents] = newton_raphson_method(x0, tol, max_iterations)
    roots = [];
    iterations = [];
    tangents = [];

    for i = 1:max_iterations
        x1 = x0 - f(x0) / df(x0);
        roots = [roots; x1];
        iterations = [iterations; i];

        tangent_slope = df(x0);
        tangent = f(x0) - tangent_slope * x0;
        tangents = [tangents; [tangent_slope, tangent]];

        if abs(f(x1)) < tol
            break;
        end

        x0 = x1;
    end
endfunction

x0 = 3;
tolerance = 1e-6;
max_iterations = 20;

[roots, iterations, tangents] = newton_raphson_method(x0, tolerance, max_iterations);

x = linspace(0, 4, 1000);
y = f(x);
plot(x, y, 'LineWidth', 1.5);
hold on;

scatter(roots, f(roots), 'r', 'filled');
text(roots, f(roots), num2str(iterations), 'VerticalAlignment','bottom', 'HorizontalAlignment','right');

for i = 1:length(tangents)
    slope = tangents(i, 1);
    intercept = tangents(i, 2);
    tangent_line = slope * x + intercept;
    plot(x, tangent_line, 'g--');
end

xlabel('x');
ylabel('f(x)');
title('Newton-Raphson Method for Root Finding');
grid on;
legend('f(x)', 'Roots', 'Tangents');
