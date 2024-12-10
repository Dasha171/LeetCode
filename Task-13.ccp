public class Solution {
    public int WiggleMaxLength(int[] nums) {
        if (nums.Length < 2)
            return nums.Length;
        int[] up = new int[nums.Length];
        int[] down = new int[nums.Length];
        for (int i = 1; i < nums.Length; i++) {
            for (int j = 0; j < i; j++) {
                if (nums[i] > nums[j]) {
                    up[i] = Math.Max(up[i], down[j] + 1);
                } else if (nums[i] < nums[j]) {
                    down[i] = Math.Max(down[i], up[j] + 1);
                }
            }
        }
        return 1 + Math.Max(down[nums.Length - 1], up[nums.Length - 1]);
    }
}
