//
//  Solution54.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/15.
//

import Foundation
/*
 剑指 Offer 54. 二叉搜索树的第k大节点
 给定一棵二叉搜索树，请找出其中第k大的节点。

 示例 1:

 输入: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 输出: 4
 示例 2:

 输入: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 输出: 4

 限制：

 1 ≤ k ≤ 二叉搜索树元素个数

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
class Solution54 {
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return 0
        }
        // 是用递归的形式, 右中左遍历, 声明一个变量, 用来标识当前是第几大, 如果刚好是k, 则当前节点就是答案

        var cur = 0
        var ans: TreeNode?
        _kthL(root, k, &cur, &ans)
        if let a = ans {
            return a.val
        }
        return 0
    }

    private func _kthL(_ root: TreeNode?, _ k: Int, _ cur: inout Int, _ ans: inout TreeNode?) {
        if ans != nil || root == nil {
            return
        }

        if root?.right != nil {
            _kthL(root?.right, k, &cur, &ans)
            if ans != nil {
                return
            }
        }
        cur += 1
        if cur == k {
            ans = root
            return
        }

        if root?.left != nil {
            _kthL(root?.left, k, &cur, &ans)
            if ans != nil {
                return
            }
        }

        return
    }
}
