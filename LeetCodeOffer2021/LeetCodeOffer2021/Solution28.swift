//
//  Solution28.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/14.
//

import Foundation

/*
 剑指 Offer 28. 对称的二叉树
 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3

  

 示例 1：

 输入：root = [1,2,2,3,4,4,3]
 输出：true
 示例 2：

 输入：root = [1,2,2,null,3,null,3]
 输出：false
  

 限制：

 0 <= 节点个数 <= 1000

 注意：本题与主站 101 题相同：https://leetcode-cn.com/problems/symmetric-tree/
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

class Solution28 {
    
    var leftArr: [Int?]
    var rightArr: [Int?]
    
    init() {
        leftArr = []
        rightArr = []
    }
    // [1,2,2,3,4,4,3]
    func isSymmetric(_ root: TreeNode?) -> Bool {
        _traverseLeft(root)
        _traverseRight(root)

        for i in 0 ..< leftArr.count {
            if leftArr[i] != rightArr[i] {
                return false
            }
        }
        return true
    }
    
    func _traverseLeft(_ root: TreeNode?) -> Void {
        if root == nil {
            leftArr.append(nil)
            return
        }
        leftArr.append(root!.val)
        _traverseLeft(root?.left)
        _traverseLeft(root?.right)
    }
    
    func _traverseRight(_ root: TreeNode?) -> Void {
        if root == nil {
            rightArr.append(nil)
            return
        }
        rightArr.append(root!.val)
        _traverseRight(root?.right)
        _traverseRight(root?.left)
    }
}
