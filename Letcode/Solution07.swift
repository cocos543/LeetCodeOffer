/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

/*
 面试题07. 重建二叉树

 输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7

 限制：

 0 <= 节点个数 <= 5000

 */

/// 采用递归的方式, 分别对每一个左右子树进行重构
/// 先序遍历的第一个元素, 对应到中序遍历数组中, 即可得到两个左右子树.
/// 依次递推, 即可构建出来.
class Solution07 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // preorder的第一个元素就是根节点, 在preorder数组中, 元素的组成: 根+ 左 + 右
        // 所以再从中序数组里面找到根的位置就可以知道左右子树分别在前序数组中占据的长度了
        // 知道子树的前序和中序之后, 递归处理即可, 还是比较简单的题目

        if preorder.count == 0 { // 前序数组和中序数组都是一样长的
            return nil
        }
        let root = TreeNode(preorder[0])

        let rootIndex = inorder.firstIndex(of: preorder[0])!
        // 处理左子树
        root.left = buildTree(Array(preorder[1 ..< 1 + rootIndex]), Array(inorder[0 ..< rootIndex]))
        root.right = buildTree(Array(preorder[1 + rootIndex ..< 1 + rootIndex + (inorder.count-1-rootIndex)]), Array(inorder[1 + rootIndex ..< inorder.count]))

        return root
    }
    
    func buildTree2(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // 两个数组的长度肯定是一样的

        // 如果数组只有一个元素, 那么这个元素就是子树的根节点了
        if inorder.count <= 0 {
            return nil
        }

        let root = TreeNode(preorder[0])

        if preorder.count > 1 {
            // 数组有多个元素, 说明存在左子树或者右子树, 通过中序数组分别构建左右子树
            
            // 前序数组的第一个元素, 可以将中序数组拆分成左右子树
            let first = preorder.first!
            let index = inorder.firstIndex(of: first)!
            
            // 特殊处理一下, 如果如果前序数组第一个元素出现在中序数组第一个位置, 说明不存在左子树; 如果出现在中序数组最后, 说明没有右子树(不需要特殊处理)
            var leftInorder, rightInorder: ArraySlice<Int>
            if index == 0 {
                leftInorder = []
            }else {
                leftInorder = inorder[0 ..< index]
            }
            rightInorder = inorder[index + 1 ..< inorder.endIndex]
            

            // 从中序数组中可以得到左右子树的长度ln, rn
            // 前序遍历数组中, 除了第一个元素, 后面的ln个元素就是左子树, rn个元素是右子树
            let leftPreorder = preorder[1 ..< 1 + leftInorder.count]

            let rightPreorder = preorder[1 + leftInorder.count ..< inorder.endIndex]

            root.left = buildTree(Array(leftPreorder), Array(leftInorder))
            root.right = buildTree(Array(rightPreorder), Array(rightInorder))
        }
        return root
    }
}
