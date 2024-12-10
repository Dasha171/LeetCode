using System;
using System.Collections.Generic;

public class Solution {
    public IList<IList<int>> KSmallestPairs(int[] nums1, int[] nums2, int k) {
        int m = nums1.Length, n = nums2.Length;
        var ans = new List<IList<int>>();
        var visited = new HashSet<(int, int)>();
        var minHeap = new SortedSet<(int, int, int)>();
        minHeap.Add((nums1[0] + nums2[0], 0, 0));
        visited.Add((0, 0));

        while (k-- > 0 && minHeap.Count > 0) {
            var top = minHeap.Min;
            minHeap.Remove(top);
            int i = top.Item2, j = top.Item3;
            ans.Add(new List<int> { nums1[i], nums2[j] });

            if (i + 1 < m && !visited.Contains((i + 1, j))) {
                minHeap.Add((nums1[i + 1] + nums2[j], i + 1, j));
                visited.Add((i + 1, j));
            }

            if (j + 1 < n && !visited.Contains((i, j + 1))) {
                minHeap.Add((nums1[i] + nums2[j + 1], i, j + 1));
                visited.Add((i, j + 1));
            }
        }

        return ans;
    }
}
