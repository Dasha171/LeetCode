public class Solution {
    private static readonly int[][] dir = new int[][] {
        new int[] {0, 1}, new int[] {1, 0},
        new int[] {0, -1}, new int[] {-1, 0}
    };

    public int LongestIncreasingPath(int[][] matrix) {
        int m = matrix.Length;
        if (m == 0) return 0;
        int n = matrix[0].Length;
        int[][] outdegree = new int[m + 2][];
        for (int i = 0; i < outdegree.Length; i++)
            outdegree[i] = new int[n + 2];
        int[][] newMatrix = new int[m + 2][];
        for (int i = 0; i < newMatrix.Length; i++)
            newMatrix[i] = new int[n + 2];

        for (int i = 0; i < m; ++i) {
            Array.Copy(matrix[i], 0, newMatrix[i + 1], 1, n);
        }

        for (int i = 1; i <= m; ++i) {
            for (int j = 1; j <= n; ++j) {
                foreach (var d in dir) {
                    if (newMatrix[i][j] < newMatrix[i + d[0]][j + d[1]]) {
                        outdegree[i][j]++;
                    }
                }
            }
        }

        List<int[]> leaves = new List<int[]>();
        for (int i = 1; i <= m; ++i) {
            for (int j = 1; j <= n; ++j) {
                if (outdegree[i][j] == 0) leaves.Add(new int[] { i, j });
            }
        }

        int height = 0;
        while (leaves.Count > 0) {
            height++;
            List<int[]> newLeaves = new List<int[]>();
            foreach (var node in leaves) {
                foreach (var d in dir) {
                    int x = node[0] + d[0], y = node[1] + d[1];
                    if (newMatrix[node[0]][node[1]] > newMatrix[x][y]) {
                        outdegree[x][y]--;
                        if (outdegree[x][y] == 0) newLeaves.Add(new int[] { x, y });
                    }
                }
            }
            leaves = newLeaves;
        }

        return height;
    }
}
