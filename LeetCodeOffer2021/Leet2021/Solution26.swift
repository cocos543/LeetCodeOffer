//
//  Solution26.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/14.
//

import Foundation

/*
 剑指 Offer 26. 树的子结构
 输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)

 B是A的子结构， 即 A中有出现和B相同的结构和节点值。

 例如:
 给定的树 A:

      3
     / \
    4   5
   / \
  1   2
 给定的树 B：

    4
   /
  1
 返回 true，因为 B 与 A 的一个子树拥有相同的结构和节点值。

 示例 1：

 输入：A = [1,2,3], B = [3,1]
 输出：false
 示例 2：

 输入：A = [3,4,5,1,2], B = [4,1]
 输出：true
 限制：

 0 <= 节点个数 <= 10000

 通过次数99,158提交次数214,772
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
class Solution26 {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil {
            return false
        }
        
        if A == nil {
            return false
        }
        
        // 中 左 右, A树的任意节点都可能匹配B树的根节点
        return _deepCheck(A, B) || isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
    }
    
    // 检测子树是否符合条件(先序遍历: 中左右)
    func _deepCheck(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil {
            return true
        }
        if A == nil {
            return false
        }
        if A!.val == B!.val {
            // 根节点相等,递归子树
            return _deepCheck(A?.left, B?.left) && _deepCheck(A?.right, B?.right)
        }else {
            return false
        }
    }
    
}
