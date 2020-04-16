//
//  Solution26.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/1.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题26. 树的子结构
 
 输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)

 B是A的子结构， 即 A中有出现和B相同的结构和节点值。

 例如:
 给定的树 A:

      3
     / \
    4   5
   / \
  1   2
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

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
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

class Solution25 {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        // A树的每一个节点都可以是B树的根节点, 所以需要先遍历A树, 把每一个节点都尝试当作B树的根节点, 和B树比较
        // 比较的过程可以看成是递归, 例如, A树的节点a, 和B树根节点相同, 则继续递归比较a节点的左右节点
        
        // 这里直接用前序遍历, 中, 左, 右
        if A == nil || B == nil {
            return false
        }
        return _preOrder(A, B)
    }

    // 中, 左, 右
    func _preOrder(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil {
            return false
        }

        if _isSameTree(A, B) {
            return true
        }else {
            return _preOrder(A!.left, B) || _preOrder(A!.right, B)
        }
    }

    func _isSameTree(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        // B节点是空的, A不为空, 说明不需要比较了, 直接返回true
        if B == nil {
            return true
        }
        
        if A == nil {
            // B不为空但是A已经是空的, 说明结构肯定不匹配, 返回false
            return false
        }
        
        if A!.val == B!.val {
            return _isSameTree(A!.left, B!.left) && _isSameTree(A!.right, B!.right)
        }else {
            return false
        }
    }
}
