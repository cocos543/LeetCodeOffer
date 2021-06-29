//
//  Solution34.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/20.
//

import Foundation
/*
 剑指 Offer 34. 二叉树中和为某一值的路径
 输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。

  

 示例:
 给定如下二叉树，以及目标和 target = 22，

               5
              / \
             4   8
            /   / \
           11  13  4
          /  \    / \
         7    2  5   1
 返回:

 [
    [5,4,11,2],
    [5,8,4,5]
 ]
  

 提示：

 节点总数 <= 10000
 注意：本题与主站 113 题相同：https://leetcode-cn.com/problems/path-sum-ii/

 通过次数95,056提交次数164,685

 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution34 {
    var ret = [[Int]]()
    
    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
        // 当前节点只需要计算target减去自己的差值是否为0, 不为0则继续递归交给字节点计算即可
        if root == nil {
            return ret
        }
        
        _sum(root!, target, [])
        
        return ret
    }
    
    // 注意, 节点的值可能是 负数 的, 所以必须查找到叶子节点才能确定答案是否成立
    func _sum(_ root: TreeNode, _ target: Int, _ arr: [Int]) {
        if root.val == target {
            // 符合要求的记录, 不符合要求的还是要继续查找
            if root.left == nil && root.right == nil {
                var tarr = arr
                tarr.append(root.val)
                ret.append(tarr)
            }
        }

        if root.left != nil {
            var tarr = arr
            tarr.append(root.val)
            _sum(root.left!, target - root.val, tarr)
        }
        
        if root.right != nil {
            var tarr = arr
            tarr.append(root.val)
            _sum(root.right!, target - root.val, tarr)
        }
    }
}
