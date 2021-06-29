//
//  Solution56.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/16.
//

import Foundation
/*
 剑指 Offer 56 - I. 数组中数字出现的次数
 一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

  

 示例 1：

 输入：nums = [4,1,4,6]
 输出：[1,6] 或 [6,1]
 示例 2：

 输入：nums = [1,2,10,4,1,4,3,3]
 输出：[2,10] 或 [10,2]
  

 限制：

 2 <= nums.length <= 10000
  

 通过次数92,273提交次数131,303

 */
class Solution56 {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return []
        }
        // 把问题简化一下, 如果数组其他数字都出现两次, 有一个出现一次, 那么直接用异或扫描一次数组, 剩下的就是只出现一次的数字.
        // 这道题, 要做的事情就是把这两个不同的数字分开放在两组里面, 而且重复出现的数字也在同一组.
        
        // 先把两个只出现一次的数字的异或结果获取出来, 接着根据异或的定义, 找到右数第一个不为0的位, 这个位对应的意义就是两个目标数字在这个位的值不同
        // 所以再一次遍历数组, 按照这个位来区分, 等于的一组, 不等的一组, 这样就顺利把两个目标数组分在两组里面了
        
        var n = 0
        for e in nums {
            n ^= e
        }
        
        var check = 1
        while check & n == 0 {
            check = check << 1
        }
        
        // 分组
        var ans1 = 0
        var ans2 = 0
        for e in nums {
            if check & e > 0 {
                ans1 ^= e
            } else {
                ans2 ^= e
            }
        }
        
        return [ans1, ans2]
    }
}
