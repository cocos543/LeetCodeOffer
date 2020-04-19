//
//  Solution_letCode3.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/18.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 3. 剧情触发时间

 通过的用户数313
 尝试过的用户数779
 用户总通过次数313
 用户总提交次数1144
 题目难度Medium
 在战略游戏中，玩家往往需要发展自己的势力来触发各种新的剧情。一个势力的主要属性有三种，分别是文明等级（C），资源储备（R）以及人口数量（H）。在游戏开始时（第 0 天），三种属性的值均为 0。

 随着游戏进程的进行，每一天玩家的三种属性都会对应增加，我们用一个二维数组 increase 来表示每天的增加情况。这个二维数组的每个元素是一个长度为 3 的一维数组，例如 [[1,2,1],[3,4,2]] 表示第一天三种属性分别增加 1,2,1 而第二天分别增加 3,4,2。

 所有剧情的触发条件也用一个二维数组 requirements 表示。这个二维数组的每个元素是一个长度为 3 的一维数组，对于某个剧情的触发条件 c[i], r[i], h[i]，如果当前 C >= c[i] 且 R >= r[i] 且 H >= h[i] ，则剧情会被触发。

 根据所给信息，请计算每个剧情的触发时间，并以一个数组返回。如果某个剧情不会被触发，则该剧情对应的触发时间为 -1 。

 示例 1：

 输入： increase = [[2,8,4],[2,5,0],[10,9,8]] requirements = [[2,11,3],[15,10,7],[9,17,12],[8,1,14]]

 输出: [2,-1,3,-1]

 解释：

 初始时，C = 0，R = 0，H = 0

 第 1 天，C = 2，R = 8，H = 4

 第 2 天，C = 4，R = 13，H = 4，此时触发剧情 0

 第 3 天，C = 14，R = 22，H = 12，此时触发剧情 2

 剧情 1 和 3 无法触发。

 示例 2：

 输入： increase = [[0,4,5],[4,8,8],[8,6,1],[10,10,0]] requirements = [[12,11,16],[20,2,6],[9,2,6],[10,18,3],[8,14,9]]

 输出: [-1,4,3,3,3]

 示例 3：

 输入： increase = [[1,1,1]] requirements = [[0,0,0]]

 输出: [0]

 限制：

 1 <= increase.length <= 10000
 1 <= requirements.length <= 100000
 0 <= increase[i] <= 10
 0 <= requirements[i] <= 100000
 */

class SolutionLetCode3 {
    // 存放还未被触发的剧情, key存在的都是还未触发的
    var unTiggerStoryMap = [Int: Bool]()
    
    // 剧情全部触发了
    var ret = [Int]()

    func getTriggerTime(_ increase: [[Int]], _ requirements: [[Int]]) -> [Int] {
        var requirements = requirements
        // 把每个剧情的资源都放到一个数组中, 一共三个数组
        var story1 = [Int]()
        var story2 = [Int]()
        var story3 = [Int]()
        
        
        // 初始化剧情map
        for i in 0 ..< requirements.count {
            unTiggerStoryMap[i] = true
            story1.append(requirements[i][0])
            story2.append(requirements[i][1])
            story3.append(requirements[i][2])
        }
        // 资源分别从小到达排序
        story1.sort()
        story2.sort()
        story3.sort()

        // 初始化返回值为-1
        ret = Array(repeating: -1, count: requirements.count)

        var curRes = [0, 0, 0]

        for day in 0 ... increase.count {
            
            // 增加之前先判断是否能触发
            canTigger(&curRes, &requirements, day)
            
            if unTiggerStoryMap.keys.count == 0 {
                break
            }
            
            
            // 是否已经是最后一天
            if day < increase.count {
                // 每天资源都在增加
                curRes[0] = curRes[0] + increase[day][0]
                curRes[1] = curRes[1] + increase[day][1]
                curRes[2] = curRes[2] + increase[day][2]
            }
        }

        return ret
    }

    // 返回被触发的剧情标号数组, 一次可能触发多个剧情
    func canTigger(_ curRes: inout [Int], _ requirements: inout [[Int]], _ day: Int) {
        // 先查询剧情是否已经被触发, 是的话直接返回
        for key in unTiggerStoryMap.keys {
            // 判断是否要触发
            if curRes[0] >= requirements[key][0] &&
                curRes[1] >= requirements[key][1] &&
                curRes[2] >= requirements[key][2] {
                // 触发
                unTiggerStoryMap.removeValue(forKey: key)
                ret[key] = day
            }
        }
    }
}
