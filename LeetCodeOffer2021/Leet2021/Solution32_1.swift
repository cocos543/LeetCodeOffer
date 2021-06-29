//
//  Solution32_1.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/18.
//

import Foundation

/*
 剑指 Offer 32 - I. 从上到下打印二叉树
 从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。

  

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回：

 [3,9,20,15,7]
  

 提示：

 节点总数 <= 1000
 通过次数96,247提交次数148,884
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
class Solution32_1 {
    func levelOrder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var ret = [Int]()
        let q = Queue<TreeNode>()
        _ = q.enQueue(root)
        
        while !q.isEmpty() {
            let p = q.deQueue()!
            ret.append(p.val)
            if p.left != nil {
                _ = q.enQueue(p.left)
            }
            if p.right != nil {
                _ = q.enQueue(p.right)
            }
        }
        
        return ret
    }
}
