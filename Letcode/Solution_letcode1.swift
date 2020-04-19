//
//  Solution_letcode1.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/18.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*

 1. 拿硬币

 桌上有 n 堆力扣币，每堆的数量保存在数组 coins 中。我们每次可以选择任意一堆，拿走其中的一枚或者两枚，求拿完所有力扣币的最少次数。

 示例 1：

 输入：[4,2,1]

 输出：4

 解释：第一堆力扣币最少需要拿 2 次，第二堆最少需要拿 1 次，第三堆最少需要拿 1 次，总共 4 次即可拿完。

 示例 2：

 输入：[2,3,10]

 输出：8

 限制：

 1 <= n <= 4
 1 <= coins[i] <= 10

 */

class Solution_letcode {
    func minCount(_ coins: [Int]) -> Int {
        var ret = 0
        for e in coins {
            ret = ret + e / 2 + e % 2
        }
        return ret
    }

    /*
     2. 传递信息
     小朋友 A 在和 ta 的小伙伴们玩传信息游戏，游戏规则如下：

     有 n 名玩家，所有玩家编号分别为 0 ～ n-1，其中小朋友 A 的编号为 0
     每个玩家都有固定的若干个可传信息的其他玩家（也可能没有）。传信息的关系是单向的（比如 A 可以向 B 传信息，但 B 不能向 A 传信息）。
     每轮信息必须需要传递给另一个人，且信息可重复经过同一个人
     给定总玩家数 n，以及按 [玩家编号,对应可传递玩家编号] 关系组成的二维数组 relation。返回信息从小 A (编号 0 ) 经过 k 轮传递到编号为 n-1 的小伙伴处的方案数；若不能到达，返回 0。

     示例 1：

     输入：n = 5, relation = [[0,2],[2,1],[3,4],[2,3],[1,4],[2,0],[0,4]], k = 3

     输出：3

     解释：信息从小 A 编号 0 处开始，经 3 轮传递，到达编号 4。共有 3 种方案，分别是 0->2->0->4， 0->2->1->4， 0->2->3->4。

     示例 2：

     输入：n = 3, relation = [[0,2],[2,1]], k = 2

     输出：0

     解释：信息不能从小 A 处经过 2 轮传递到编号 2*/
    // 传递信号

    // 用来保存结果
    var count = 0
    var target = 0

    func numWays(_ n: Int, _ relation: [[Int]], _ k: Int) -> Int {
        // 这个可以抽象成一个有向图, 从节点0到节点n-1处, 有多少条路径, 路径数为k;
        // 假设k=3, n=5, 则求0到4有多少条路径, 路径长度是3
        // 用图的深度优先搜索法. 先把关系转换 [点: [指向节点数组]]

        var graph = [Int: [Int]]()
        for e in relation {
            if graph[e[0]] == nil {
                graph[e[0]] = [e[1]]
            } else {
                graph[e[0]]?.append(e[1])
            }
        }
        target = n - 1
        df(graph, 0, k)
        return count
    }

    func df(_ graph: [Int: [Int]], _ curNode: Int, _ depth: Int) {
        if depth == 0 {
            // 是否达到目的地
            if curNode == target {
                count = count + 1
            }
            return
        }
        let gotoNodes = graph[curNode]
        if let nodes = gotoNodes {
            for nextNode in nodes {
                df(graph, nextNode, depth - 1)
            }
        }
    }
}
