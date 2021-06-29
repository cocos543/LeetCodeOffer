//
//  Solution55_2.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/16.
//

import Foundation
/*
 剑指 Offer 55 - II. 平衡二叉树
 输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。

  

 示例 1:

 给定二叉树 [3,9,20,null,null,15,7]

     3
    / \
   9  20
     /  \
    15   7
 返回 true 。

 示例 2:

 给定二叉树 [1,2,2,3,3,null,null,4,4]

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 返回 false 。

  

 限制：

 0 <= 树的结点个数 <= 10000
 */
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
class Solution55_2 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        var ans = true
        _ = _maxDepth(root, &ans)
        return ans
    }
    
    func _maxDepth(_ root: TreeNode?, _ ans: inout Bool) -> Int {
        var dl = 0, dr = 0
        if !ans {
            return 0
        }
        
        if let l = root?.left {
            dl = _maxDepth(l, &ans)
        }
        
        if !ans {
            return 0
        }
        
        if let r = root?.right {
            dr = _maxDepth(r, &ans)
        }
        
        if abs(dl - dr) > 1 {
            ans = false
            return 0
        }
        
        if dl > dr {
            return dl + 1
        } else {
            return dr + 1
        }
    }
}
