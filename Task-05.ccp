public class Solution {
    public int FindComplement(int num) {
        int bitmask = num;
        bitmask |= (bitmask >> 1);
        bitmask |= (bitmask >> 2);
        bitmask |= (bitmask >> 4);
        bitmask |= (bitmask >> 8);
        bitmask |= (bitmask >> 16);
        return bitmask ^ num;
    }
}
