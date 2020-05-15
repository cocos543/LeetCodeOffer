//
//  Solution32.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/3.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution32 {
    func levelOrder(_ root: TreeNode?) -> [Int] {
        // 层序遍历 把节点A放入队列中, 取出A后把左右节点继续放回队列, 再访问A.
        // 这道题要求按照一层一层打印出来. 所以需要做额外的标记, 先把左右节点放到副队列里, 等主队列元素访问完成之后, 再切换副队列和主队列
        if root == nil {
            return [Int]()
        }
        var ans = [Int]()
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
            ans.append(node.val)
            if q.count == 0 {
                q = q2
                q2 = [TreeNode]()
            }
        }
        return ans
    }
    
    func levelOrder2(_ root: TreeNode?) -> [[Int]] {
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
