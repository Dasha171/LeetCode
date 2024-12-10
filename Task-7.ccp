public class Solution {
    public int GetSum(int a, int b) {
        int x = System.Math.Abs(a), y = System.Math.Abs(b);
        if (x < y) return GetSum(b, a);
        int sign = a > 0 ? 1 : -1;

        if (a * b >= 0) {
            while (y != 0) {
                int carry = (x & y) << 1;
                x ^= y;
                y = carry;
            }
        } else {
            while (y != 0) {
                int borrow = ((~x) & y) << 1;
                x ^= y;
                y = borrow;
            }
        }
        return x * sign;
    }
}
