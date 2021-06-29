//
//  Solution60.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/23.
//

import Foundation
/* 剑指 Offer 60. n个骰子的点数
 把n个骰子扔在地上，所有骰子朝上一面的点数之和为s。输入n，打印出s的所有可能的值出现的概率。

 你需要用一个浮点数数组返回答案，其中第 i 个元素代表这 n 个骰子所能掷出的点数集合中第 i 小的那个的概率。

 示例 1:

 输入: 1
 输出: [0.16667,0.16667,0.16667,0.16667,0.16667,0.16667]
 示例 2:

 输入: 2
 输出: [0.02778,0.05556,0.08333,0.11111,0.13889,0.16667,0.13889,0.11111,0.08333,0.05556,0.02778]

 限制：

 1 <= n <= 11

 通过次数51,269提交次数92,715
 */
class Solution66 {
    func dicesProbability(_ n: Int) -> [Double] {
        if n <= 1 {
            return [0.16667,0.16667,0.16667,0.16667,0.16667,0.16667]
        }
        
        // 动态规划解法, 因为骰子总的数量优先, 一共就11个, 所以只需要把每次的可能结果都找出来, 就可以算出概率.
        // 六个面每次出现的概率都是一样的, 所以只需要计算可能出现的点数的分布情况, 再除以总共出现的次数即可.
        let number = n
        let singleMax = 6
        var arr1 = Array(repeating: 0, count: number * 6 + 1)
        var arr2 = Array(repeating: 0, count: number * 6 + 1)

        // 第一个骰子出现1-6, 概率相等, 每种出现一次
        for i in 1 ... singleMax {
            arr2[i] = 1
        }

        for k in 2 ... number {
            // 每个骰子可能出现的点数都是1-6
            // 根据当前第k个骰子, 可以确定可能存在的最大的点数是max*i, 比如第2个骰子, 最大点数肯定就是6*2=12, 最小的点数是1*2=2, 所以只需要检索2-12就可以

            // k个筛子的最小点数不可能小于k, 所以把历史的总数小于k的结果都清0
            for i in 0 ..< k {
                arr1[i] = 0
            }
            for sum in k ... k * singleMax {
                arr1[sum] = 0
                for j in 1 ... singleMax {
                    // 当前点数总和是sum, 本次骰子点数j, j肯定不能大于sum, 所以加一个限制条件
                    if j > sum {
                        break
                    }
                    // 上一次总和sum-j, 加上本次j, 得到总和是sum, 所以总和sum的出现次数, 就是上一次sum-j出现的次数, 加上经过本次已经累计的次数
                    arr1[sum] += arr2[sum - j]
                }
            }
            
            let t = arr1
            arr1 = arr2
            arr2 = t
        }
        
        // number个骰子一共出现的可能次数是6^number次, 次数的频率分布在arr2数组中, 数组下标i的含义就是总点数i
        var total = 1
        var pow = number
        while pow > 0 {
            total *= singleMax
            pow -= 1
        }
        
        var ans = [Double]()
        for i in number ... singleMax * number {
            if arr2[i] > 0 {
                let radio = Double(arr2[i]) / Double(total)
                ans.append(radio)
            }
        }

        // 结果存放在arr2中
        return ans
    }
}
