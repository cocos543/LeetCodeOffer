//
//  Solution33.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/4.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution34 {
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        // 采用深度优先搜索的思想, 如果节点的值加起来大于sum则停止继续递归下去.
        // 如果节点的值加起来刚好等于sum, 而且节点是叶子节点, 那么这条路径就是答案之一
        if root == nil {
            return [[Int]]()
        }
        var ans = [[Int]]()
        findPath(root, 0, [Int](), sum, &ans)
        return ans
    }

    func findPath(_ root: TreeNode?, _ cur: Int, _ path: [Int], _ sum: Int, _ ans: inout [[Int]]) {
        if root == nil {
            return
        }
        var path = path
        path.append(root!.val)
        if (root!.val + cur) == sum {
            if root!.left == nil && root!.right == nil {
                ans.append(path)
            }
        }
        findPath(root!.left, cur + root!.val, path, sum, &ans)
        findPath(root!.right, cur + root!.val, path, sum, &ans)
    }
    
    func pathSum2(_ root: TreeNode?, _ sum: Int) -> [[Int]] {

        // 这道题不需要观察规律, 只要把每一条路径都走一下, 把符合条件的路径保存起来就可以
        var result = [[Int]]()
        
        // 记录走到当前节点的路径
        var path = [Int]()
        findPath2(root, 0, sum, &path, &result)

        return result
    }
    // num: 当前路径的总值
    func findPath2(_ root: TreeNode?, _ num: Int, _ sum: Int, _ path: inout [Int], _ result: inout [[Int]]) {
        if root == nil {
            return
        }
        let num = num + root!.val

        // 当前节点进入路径
        var path = path
        path.append(root!.val)

        // 当前节点所在路径符合要求
        if num == sum {
            // 答案判断有点问题...
            // 答案的评判标准, 路径必须到达叶子节点才算是路径
            // 但是如果整个树只有一个节点, 那么这个节点要加进去
            if root!.left == nil && root!.right == nil {
                result.append(path)
            }
            return
        }

        if root!.left != nil {
            findPath2(root!.left, num, sum, &path, &result)
        }
        if root!.right != nil {
            findPath2(root!.right, num, sum, &path, &result)
        }

    }
}
