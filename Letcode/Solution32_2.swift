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
        // 层序遍历 把节点A放入队列中, 取出A后把左右节点继续放回队列, 再访问A.
        // 这道题要求按照一层一层打印出来. 所以需要做额外的标记, 先把左右节点放到副队列里, 等主队列元素访问完成之后, 再切换副队列和主队列
        if root == nil {
            return [[Int]]()
        }
        var ans = [[Int]]()
        var layerVals = [Int]()
        var q = [TreeNode]()
        // 副队列
        var q2 = [TreeNode]()
        q.append(root!)
        while q.count > 0 {
            let node = q.removeFirst()
            if let l = node.left {
                q2.append(l)
            }
            if let r = node.right {
                q2.append(r)
            }
            layerVals.append(node.val)
            if q.count == 0 {
                q = q2
                q2 = [TreeNode]()
                ans.append(layerVals)
                layerVals = [Int]()
            }
        }
        return ans
    }
    
    func levelOrder2(_ root: TreeNode?) -> [[Int]] {
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
