public class Solution {
    public IList<int> MajorityElement(int[] nums) {
        int count1 = 0, count2 = 0;
        int? candidate1 = null, candidate2 = null;
        
        foreach (int n in nums) {
            if (candidate1.HasValue && candidate1 == n) {
                count1++;
            } else if (candidate2.HasValue && candidate2 == n) {
                count2++;
            } else if (count1 == 0) {
                candidate1 = n;
                count1 = 1;
            } else if (count2 == 0) {
                candidate2 = n;
                count2 = 1;
            } else {
                count1--;
                count2--;
            }
        }
        
        count1 = 0;
        count2 = 0;
        
        foreach (int n in nums) {
            if (candidate1.HasValue && candidate1 == n) count1++;
            if (candidate2.HasValue && candidate2 == n) count2++;
        }
        
        IList<int> result = new List<int>();
        int nLength = nums.Length;
        if (count1 > nLength / 3) result.Add(candidate1.Value);
        if (count2 > nLength / 3) result.Add(candidate2.Value);
        
        return result;
    }
}
