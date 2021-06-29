//
//  Solution27.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/14.
//

import Foundation

/*剑指 Offer 27. 二叉树的镜像
 请完成一个函数，输入一个二叉树，该函数输出它的镜像。

 例如输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 镜像输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

  

 示例 1：

 输入：root = [4,2,7,1,3,6,9]
 输出：[4,7,2,9,6,3,1]
  

 限制：

 0 <= 节点个数 <= 1000

 注意：本题与主站 226 题相同：https://leetcode-cn.com/problems/invert-binary-tree/


 */
class Solution27 {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        _action(root)
        return root
    }
    
    func _action(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        let t = root?.right
        root?.right = root?.left
        root?.left = t
        
        _action(root?.left)
        _action(root?.right)
    }
}
