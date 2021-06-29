//
//  Solution07.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/25.
//

import Foundation

/*
 输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7

 限制：

 0 <= 节点个数 <= 5000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution07 {
    /*
     根据前序遍历和中序遍历的特点, 先找到前序遍历的根节点和左右子树, 再递归左右子树.
     */
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }

        let root = TreeNode(preorder[0])

        // 从中序遍历中找到左右子树, 依次递归
        // 这里强制解包, 如果输入的数组不合法直接让他crash掉即可.
        let rootIdx = inorder.firstIndex(of: root.val)!

        let leftPreArr = preorder[1 ..< (1 + rootIdx)]
        let leftInArr = inorder[0 ..< rootIdx]

        let rightPreArr = preorder[(1 + rootIdx) ..< preorder.endIndex]
        let rightInArr = inorder[rootIdx + 1 ..< inorder.endIndex]

        root.left = buildTree(Array(leftPreArr), Array(leftInArr))
        root.right = buildTree(Array(rightPreArr), Array(rightInArr))

        return root
    }
}
