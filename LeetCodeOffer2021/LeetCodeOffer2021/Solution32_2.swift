//
//  Solution33_2.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/19.
//

import Foundation
/*
 剑指 Offer 32 - II. 从上到下打印二叉树 II
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。

  

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]
  

 提示：

 节点总数 <= 1000
 注意：本题与主站 102 题相同：https://leetcode-cn.com/problems/binary-tree-level-order-traversal/

 通过次数99,134提交次数144,714
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
class Solution32_2 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        // 预先通过当前层计算出下一层的节点数, 并记录好层号
        var level = 0
        var lnum = 0
        var remind = 1
        var ret = [[Int]]()
        ret.append([])
        
        let q = Queue<TreeNode>()
        _ = q.enQueue(root)
        
        
        while !q.isEmpty() {
            let node = q.deQueue()!
            if remind > 0 {
                remind -= 1
            } else {
                level += 1
                ret.append([])
                // 减1是因为本次循环也会消耗一个元素
                remind = lnum - 1
                lnum = 0
            }
            ret[level].append(node.val)
            if node.left != nil {
                lnum += 1
                _ = q.enQueue(node.left)
            }
            if node.right != nil {
                lnum += 1
                _ = q.enQueue(node.right)
            }
        }
        return ret
    }
}
