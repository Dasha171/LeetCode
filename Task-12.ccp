public class Solution {
    public int MinMoves2(int[] nums) {
        long ans = long.MaxValue;
        int minval = int.MaxValue;
        int maxval = int.MinValue;
        foreach (int num in nums) {
            minval = Math.Min(minval, num);
            maxval = Math.Max(maxval, num);
        }
        for (int i = minval; i <= maxval; i++) {
            long sum = 0;
            foreach (int num in nums) {
                sum += Math.Abs(num - i);
            }
            ans = Math.Min(ans, sum);
        }
        return (int) ans;
    }
}
