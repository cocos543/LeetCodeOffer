//
//  Solution56_2.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/17.
//

import Foundation
/*
 剑指 Offer 56 - II. 数组中数字出现的次数 II
 在一个数组 nums 中除一个数字只出现一次之外，其他数字都出现了三次。请找出那个只出现一次的数字。

  

 示例 1：

 输入：nums = [3,4,3,3]
 输出：4
 示例 2：

 输入：nums = [9,1,7,9,7,9,7]
 输出：1
  

 限制：

 1 <= nums.length <= 10000
 1 <= nums[i] < 2^31
  

 通过次数69,407提交次数86,992
 */
class Solution56_2 {
    func singleNumber(_ nums: [Int]) -> Int {
        // 假设全部数字都出现三次的数字, 每个位加起来肯定是能被3整除的
        // 此时如果存在一个数只出现一次的(该数大于1), 那么必然会出现有一个位无法被3整除, 找到无法被三整除的位, 所有无法被整除的位都意味着目标数字在该位的值是1, 其他是0
        // 这样就能找出目标数字了
        
        var arr64 = Array(repeating: 0, count: 64)
        
        
        for i in 0 ..< 64 {
            let check = 1 << i
            for e in nums {
                arr64[i] += check & e
            }
        }
        
        var ans = 0
        for i in 0 ..< 64 {
            if arr64[i] % 3 != 0 {
                ans += 1 << i
            }
        }
        
        return ans
    }
}
