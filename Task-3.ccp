public class Solution {
    public int KthSmallest(TreeNode root, int k) {
        Stack<TreeNode> stack = new Stack<TreeNode>();
        
        while (true) {
            while (root != null) {
                stack.Push(root);
                root = root.left;
            }
            root = stack.Pop();
            if (--k == 0) return root.val;
            root = root.right;
        }
    }
}
