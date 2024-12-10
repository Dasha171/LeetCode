public class Solution {
    public int IslandPerimeter(int[][] grid) {
        int rows = grid.Length;
        int cols = grid[0].Length;
        
        int result = 0;
        
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (grid[r][c] == 1) {
                    int up = (r == 0) ? 0 : grid[r-1][c];
                    int left = (c == 0) ? 0 : grid[r][c-1];
                    int down = (r == rows-1) ? 0 : grid[r+1][c];
                    int right = (c == cols-1) ? 0 : grid[r][c+1];
                    
                    result += 4 - (up + left + right + down);
                }
            }
        }
        
        return result;
    }
}
