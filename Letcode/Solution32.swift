//
//  Solution32.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/3.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution32 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        // 层序遍历, 用队列实现
        // 直接用一个普通数组当作队列了..
        if root == nil {
            return [[Int]]()
        }

        var result = [[Int]]()
        var q = [root!]

        // 增加一个层级标记, 标记当前这一层有多少节点, 把每层全部节点一次性遍历出来, 然后再遍历下一层
        // 第一层就1个元素
        var lcount = 1

        while q.count > 0 {
            var lvals = [Int]()
            var newLCount = 0
            for _ in 0 ..< lcount {
                // 出队
                let node = q.removeFirst()
                lvals.append(node.val)
                if node.left != nil {
                    q.append(node.left!)
                    newLCount = newLCount + 1
                }

                if node.right != nil {
                    q.append(node.right!)
                    newLCount = newLCount + 1
                }
            }
            result.append(lvals)
            lcount = newLCount
        }
        return result
    }
}
