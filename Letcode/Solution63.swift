//
//  Solution63.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/22.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation
/*

 面试题63. 股票的最大利润
 
 假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？

  

 示例 1:

 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
 示例 2:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
  

 限制：

 0 <= 数组长度 <= 10^5
 */

class Solution63 {
    
    // 高效一些的算法
    func maxProfit2(_ prices: [Int]) -> Int {
        // 观察一下规律, 如果买入价格最低的话, 最后的利润肯定就最高
        // 所以遍历数组维护一个最低价. 不过如果买到最后一天的话, 那就没利润了, 所以要尝试从第一天开始买入
        // 假设第一天买入, 第二天卖出, 获取利润, 假设在后续每天都卖出, 维护一个最大利润.
        // 然后遇到最低价的时候, 则定义为买入价, 继续在后续每天卖出, 最后即可得到最优解
        if prices.count < 2 {
            return 0
        }
        
        // 维护最低价和历史最大利润
        var minP = prices[0], ans = 0
        // 用来记录基于当前最低价的利润
        var curentMax = 0
        for p in prices {
            let t = p - minP
            if t > curentMax {
                curentMax = t
                // 更新历史最大利润
                ans = max(ans, curentMax)
            }
            if minP > p {
                minP = p
            }
        }
        return ans
        
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        // 比较简单, 第一天买入, 后面看看哪天卖出比较合适, 复杂度n+ (n-1) + (n-2) + ... + 1, 是一个等差数列
        // 时间复杂度n^2,
        if prices.count < 2 {
            return 0
        }
        
        var ans = 0
        for i in 0 ..< prices.count-1 {
            for j in i+1 ..< prices.count {
                let t = prices[j] - prices[i]
                if t > ans {
                    ans = t
                }
            }
        }
        return ans
    }
}
