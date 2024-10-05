#include <stdio.h>
int cost[100][100] = {0};
int f = 0;
//int fmin = 9999;
int mark[100] = {0};
int x[100] = {0}; // Cities visited
int cmin = 9999;
int n;
int f_min = 9999; 
int try(int k) {
    for (int v = 1; v < n; v++) { 
        if (mark[v] == 0) {
            x[k] = v;
            f += cost[x[k - 1]][v];
            mark[v] = 1;
            if (k == n - 1) { 
                if (f + cost[x[k]][x[0]] < f_min) {
                    f_min = f + cost[x[k]][x[0]];
                }
            } else {
                int g = f + cmin * (n - k);
                if (g < f_min) {
                    try(k + 1);
                }
            }
            mark[v] = 0;
            f -= cost[x[k - 1]][v];
        }
    }
    return f_min;
}

int main() {
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &cost[i][j]);
            if (cost[i][j] < cmin && cost[i][j] > 0) cmin = cost[i][j];
        }
    }
    x[0] = 0;
    mark[0] = 1;
    printf("%d", try(1));
    return 0;
}
