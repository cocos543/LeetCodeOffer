//
//  Solution32_3.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/5/15.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

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
class Solution32_3 {

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        // 层序遍历 把节点A放入队列中, 取出A后把左右节点继续放回队列, 再访问A.
        // 这道题要求按照一层一层打印出来. 所以需要做额外的标记, 先把左右节点放到副队列里, 等主队列元素访问完成之后, 再切换副队列和主队列
        // 偶数层就把数组反转后再放到ans里面..
        if root == nil {
            return [[Int]]()
        }
        var ans = [[Int]]()
        var layerVals = [Int]()
        var isEvent = false
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
                if !isEvent {
                    ans.append(layerVals)
                }else {
                    ans.append(layerVals.reversed())
                }
                isEvent = !isEvent
                
                layerVals = [Int]()
            }
        }
        return ans
    }
}
