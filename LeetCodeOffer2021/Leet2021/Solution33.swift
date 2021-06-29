//
//  Solution33.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/20.
//

import Foundation

/*
 剑指 Offer 33. 二叉搜索树的后序遍历序列
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。

  

 参考以下这颗二叉搜索树：

      5
     / \
    2   6
   / \
  1   3
 示例 1：

 输入: [1,6,3,2,5]
 输出: false
 示例 2：

 输入: [1,3,2,6,5]
 输出: true
  

 提示：

 数组长度 <= 1000
 通过次数80,644提交次数148,637
 */

class Solution33 {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        if postorder.count <= 1 {
            return true
        }
        
        // 根据二叉搜索树的特性, 最后一个元素是根节点, 比根小的部分是左节点, 大的部分是右节点
        // 可以把数组除最后一个元素外, 分成2部分, 依次递归子树
        // 如果无法完成上面划分的, 说明数组不是二叉搜索树的后续遍历
        
        var leftLen = 0
        for i in 0 ..< postorder.count - 1 {
            if postorder[i] > postorder.last! {
                break
            } else {
                leftLen = i + 1
            }
        }
        
        // 右子树所有元素必须比根节点大(这里leftLen是左子树的长度, leftLen~count-1即为右子树部分)
        for i in leftLen ..< postorder.count - 1 {
            if postorder[i] < postorder.last! {
                return false
            }
        }
        
        var ret = true
        if leftLen > 0 {
            ret = verifyPostorder(Array(postorder[0 ..< leftLen]))
        }
        return ret && verifyPostorder(Array(postorder[leftLen ..< postorder.count - 1]))
    }
}
