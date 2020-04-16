//
//  Solution54.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/13.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution54 {
    
    var target: TreeNode?

    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        // 中序遍历之后, 倒数第k个就是目标了...
        var curK = 0
        _ = kth(root, &curK, k)
        if target != nil {
            return target!.val
        }
        return 0
    }

    // curK: 当前返回的节点是倒数第k个
    // k: 题目要求的倒数第k
    // return: 表示是否找到
    func kth(_ root: TreeNode?, _ curK: inout Int, _ k: Int) -> Bool {
        if root == nil {
            return false
        }
        
        var find = kth(root!.right, &curK, k)
        
        curK = curK + 1
        if curK == k {
            target = root
            return true
        }
        
        if find == false {
            find = kth(root!.left, &curK, k)
        }
        return find
    }
}
