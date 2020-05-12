//
//  Solution28.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/2.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3

  

 示例 1：

 输入：root = [1,2,2,3,4,4,3]
 输出：true
 示例 2：

 输入：root = [1,2,2,null,3,null,3]
 输出：false
  

 限制：

 0 <= 节点个数 <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

class Solution28 {

    func isSymmetric(_ root: TreeNode?) -> Bool {
        // 对二叉树进行中左右和中右左遍历, 对比遍历结果是否相同
        if root == nil {
            return true
        }
        var result1 = [Int?]()
        var result2 = [Int?]()
        prelr(root, &result1)
        prerl(root, &result2)

        for i in 0 ..< result1.count {
            if result1[i] != result2[i] {
                return false
            }
        }
        return true
    }

    func prelr(_ root: TreeNode?, _ result: inout [Int?]) {
        result.append(root?.val)
        if root == nil {
            return
        }
        prelr(root!.left, &result)
        prelr(root!.right, &result)
    }
    func prerl(_ root: TreeNode?, _ result: inout [Int?]) {
        result.append(root?.val)
        if root == nil {
            return
        }
        prerl(root!.right, &result)
        prerl(root!.left, &result)
    }

    func isSymmetric2(_ root: TreeNode?) -> Bool {
        // 先做一次前序遍历, 根左右, 得到一个数组
        // 再做一次类前序遍历, 根右左, 得到一个数组, 如果两个数组一样, 二叉树就是对称的了.

        if root == nil {
            return true
        }

        var preOrderArr = [Int?]()
        var likePreOrderArr = [Int?]()

        preOrder(root, &preOrderArr)
        likePreOrder(root, &likePreOrderArr)

        for i in 0 ..< preOrderArr.count {
            if preOrderArr[i] != likePreOrderArr[i] {
                return false
            }
        }

        return true
    }

    // 根左右
    func preOrder(_ root: TreeNode?, _ result: inout [Int?]) {
        if root == nil {
            result.append(nil)
            return
        }
        result.append(root!.val)
        preOrder(root!.left, &result)
        preOrder(root!.right, &result)
    }

    // 根右左
    func likePreOrder(_ root: TreeNode?, _ result: inout [Int?]) {
        if root == nil {
            result.append(nil)
            return
        }
        result.append(root!.val)
        likePreOrder(root!.right, &result)
        likePreOrder(root!.left, &result)
    }
    
    // 第二种代码, 演示了如何在一个递归里开始递归两种遍历顺序
    func isSymmetric1(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return isSymmetric1(root, root)
    }
    
    func isSymmetric1(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        
        if root1 == nil && root2 == nil {
            return true
        }
        if root1 == nil || root2 == nil {
            return false
        }
        if root1?.val != root2?.val {
            return false
        }
        
        
        return isSymmetric1(root1?.left, root2?.right) && isSymmetric1(root1?.right, root2?.left)
    }
}
