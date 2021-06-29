//
//  Solution55.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/16.
//

import Foundation
/*
 剑指 Offer 55 - I. 二叉树的深度
 输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

 例如：

 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

  

 提示：

 节点总数 <= 10000
 注意：本题与主站 104 题相同：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/

 通过次数143,918提交次数182,786

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
class Solution {
    // [3,9,20,null,null,15,7]
    func maxDepth(_ root: TreeNode?) -> Int {
        // 分别递归查找左右子树的深度, 挑选深度大的子树作为当前节点的最大深度, 向上返回直到根节点
        if root == nil {
            return 0
        }
        
        return _maxDepth(root)
    }
    
    // 返回当前节点最深深度
    func _maxDepth(_ root: TreeNode?) -> Int {
        var dl = 0, dr = 0
        if let l = root?.left {
            dl = _maxDepth(l)
        }
        
        if let r = root?.right {
            dr = _maxDepth(r)
        }
        
        if dl > dr {
            return dl + 1
        } else {
            return dr + 1
        }
    }
}
