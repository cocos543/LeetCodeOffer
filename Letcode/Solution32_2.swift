//
//  Solution32_2.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/4.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution32_2 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return [[Int]]()
        }
        // 数组模仿队列
        var q = [root!]
        var lcount = 1
        var result = [[Int]]()
        var isReverse = false
        while lcount > 0 {
            // 已经知道当前层的总数了. 遍历后就从后往前插入即可
            var newCount = 0
            var lvals = [Int](repeating: 0, count: lcount)

            for i in 0 ..< lcount {
                let node = q.removeFirst()
                // 获取元素插入的位置
                if isReverse {
                    let idx = lcount - 1 - i
                    lvals[idx] = node.val
                }else {
                    lvals[i] = node.val
                }

                if node.left != nil {
                    newCount = newCount + 1
                    q.append(node.left!)
                }
                if node.right != nil {
                    newCount = newCount + 1
                    q.append(node.right!)
                }
            }
            result.append(lvals)
            lcount = newCount
            isReverse = !isReverse
        }
        return result
    }
}
