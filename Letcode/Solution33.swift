//
//  Solution33.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/5/16.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution33 {

    func verifyPostorder(_ postorder: [Int]) -> Bool {
        // 后序遍历数组有个特点, 就是根节点在数组末尾.
        // 二叉搜索树的左子树都比根节点小, 右子树比根节点大, 所以如果数组左部分比末尾小, 右部分比末尾大, 则是二叉搜索数的遍历结果.
        // 接着就递归左子树和右子树即可.
        if postorder.count <= 1  {
            return true
        }

        let last = postorder.last!
        var lIndex = 0, rIndex = 0
        var hasRight = false
        for i in 0 ..< postorder.count-1 {
            if postorder[i] > last {
                rIndex = i
                hasRight = true
                break
            }
        }

        // 右子树所有元素必须都大于last, 如果不是直接返回false
        if hasRight {
            for i in rIndex ..< postorder.count - 1 {
                if postorder[i] < last {
                    return false
                }
            }
        }
        
        // 继续递归处理
        return verifyPostorder(Array(postorder[0 ..< rIndex])) && verifyPostorder(Array(postorder[rIndex ..< postorder.count-1]))

    }

    func verifyPostorder2(_ postorder: [Int]) -> Bool {
        // 这道题如果能找出规律就不难
        // 数组的最后一个节点肯定是二叉树的根节点. 剩余的部分可以分成两部分, 左子树和右子树
        // 数组左数开始, 直到第一个比根节点大的元素之前的数组, 都是左子树, 右侧的都是右子树.
        // 再继续递归子树, 如果子树无法满足二叉搜索树的规律, 则返回false. 直到全部子树都判断完成, 返回true

        // 以 [1,3,2,6,5]为例, 5是根节点, [1,3,2]是左子树, [6]是右子树.
        // 分别递归子树, 其中[1,3,2]根节点是2, 左子树1, 右子树3, 符合
        // 右子树[6], 只有一个节点, 也符合

        if postorder.count == 1 || postorder.count == 0 {
            return true
        }

        let root = postorder[postorder.count - 1]
        var leftArr = [Int]()
        var rightArr = [Int]()
        for i in 0 ..< postorder.count - 1 {
            if postorder[i] < root {
                leftArr.append(postorder[i])
            }else {
                // 这里开始全部元素都是右子树的, 右子树的全部元素都必须比根节点大
                for j in i ..< postorder.count - 1 {
                    if postorder[j] < root {
                        return false
                    }
                    rightArr.append(postorder[j])
                }
                break
            }
        }
        
        return verifyPostorder(leftArr) && verifyPostorder(rightArr)
    }
}
