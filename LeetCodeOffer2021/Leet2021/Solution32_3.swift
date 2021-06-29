//
//  Solution32_3.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/19.
//

import Foundation
/*
 剑指 Offer 32 - III. 从上到下打印二叉树 III
 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。

  

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
   [20,9],
   [15,7]
 ]
  

 [[3],[9,20],[7,15],[]]
 
 提示：

 节点总数 <= 1000
 通过次数83,882提交次数142,627

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
class Solution32_3 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        // 现象: 单数层从左到右, 偶数层从右到左
        // 遍历单数层节点的时候, 把子节点放入栈中.
        // 遍历偶数层节点时, 再把子节点点(先右节点,后左节点)放入栈中即可
        // 每一层都要单独放在一个栈里不能混淆, 所以要定义两个栈互相切换
        var level = 0
        var ret = [[Int]]()
        ret.append([])
        
        var current = 1
        var s1 = Stack<TreeNode>()
        var s2 = Stack<TreeNode>()
        _ = s1.push(root!)
        while !s1.isEmpty {
            let node = s1.pop()!
            ret[level].append(node.val)
            if current & 1 == 1 {
                if node.left != nil {
                    _ = s2.push(node.left!)
                }
                if node.right != nil {
                    _ = s2.push(node.right!)
                }
            } else {
                if node.right != nil {
                    _ = s2.push(node.right!)
                }
                if node.left != nil {
                    _ = s2.push(node.left!)
                }
            }
            
            if s1.isEmpty {
                level += 1
                current += 1
                s1 = s2
                s2 = Stack<TreeNode>()
                if !s1.isEmpty {
                    ret.append([])
                }
            }
        }
        return ret
    }
}
