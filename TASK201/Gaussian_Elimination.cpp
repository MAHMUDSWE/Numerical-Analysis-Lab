#include <bits/stdc++.h>

using namespace std;

vector<double> gaussianElimination(const vector<vector<double>>& A, const vector<double>& B) {
    int n = A.size();

    vector<vector<double>> modifiedA = A;
    vector<double> modifiedB = B;

    for (int i = 0; i < n - 1; ++i) {
        for (int k = i + 1; k < n; ++k) {
            double factor = modifiedA[k][i] / modifiedA[i][i];
            for (int j = i; j < n; ++j) {
                modifiedA[k][j] -= factor * modifiedA[i][j];
            }
            modifiedB[k] -= factor * modifiedB[i];
        }
    }

    vector<double> coefficients(n);
    for (int i = n - 1; i >= 0; --i) {
        coefficients[i] = modifiedB[i];
        for (int j = i + 1; j < n; ++j) {
            coefficients[i] -= modifiedA[i][j] * coefficients[j];
        }
        coefficients[i] /= modifiedA[i][i];
    }

    return coefficients;
}

int main() {
    vector<double> time = {5, 8, 12};
    vector<double> velocity = {106.8, 177.2, 279.2};

    vector<vector<double>> A = {{25, 5, 1}, {64, 8, 1}, {144, 12, 1}};
    vector<double> B = {106.8, 177.2, 279.2};

    vector<double> coefficients = gaussianElimination(A, B);
    double a1 = coefficients[0];
    double a2 = coefficients[1];
    double a3 = coefficients[2];

    cout << "\nQ1: Coefficients using Gaussian elimination: \n";
    cout << "\n    a1 = " << a1 << ", a2 = " << a2 << ", a3 = " << a3 << "\n";

    double t = 6;
    double velocity_at_6 = a1 * t * t + a2 * t + a3;
    cout << "\nQ2: Velocity at t = 6 seconds: " << velocity_at_6 << " m/s\n";

    return 0;
}
