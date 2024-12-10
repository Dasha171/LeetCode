public class TreeNode {
    public int val;
    public TreeNode left;
    public TreeNode right;
    public TreeNode(int x) { val = x; }
}

public class NodeValue {
    public int minNode, maxNode, maxSize;
    
    public NodeValue(int minNode, int maxNode, int maxSize) {
        this.minNode = minNode;
        this.maxNode = maxNode;
        this.maxSize = maxSize;
    }
}

public class Solution {
    private NodeValue largestBSTSubtreeHelper(TreeNode root) {
        if (root == null) {
            return new NodeValue(int.MaxValue, int.MinValue, 0);
        }
        
        NodeValue left = largestBSTSubtreeHelper(root.left);
        NodeValue right = largestBSTSubtreeHelper(root.right);
        
        if (left.maxNode < root.val && root.val < right.minNode) {
            return new NodeValue(Math.Min(root.val, left.minNode), Math.Max(root.val, right.maxNode), 
                                 left.maxSize + right.maxSize + 1);
        }
        
        return new NodeValue(int.MinValue, int.MaxValue, Math.Max(left.maxSize, right.maxSize));
    }
    
    public int LargestBSTSubtree(TreeNode root) {
        return largestBSTSubtreeHelper(root).maxSize;
    }
}
