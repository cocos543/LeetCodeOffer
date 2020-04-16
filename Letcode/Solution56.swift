//
//  Solution56.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/15.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

  

 示例 1：

 输入：nums = [4,1,4,6]
 输出：[1,6] 或 [6,1]
 示例 2：

 输入：nums = [1,2,10,4,1,4,3,3]
 输出：[2,10] 或 [10,2]
  

 限制：

 2 <= nums <= 10000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution56 {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        // 先用异或扫一遍数组,
        // 就可以把数组中两个只出现1次的数字的异或结果计算出来

        // 比如异或出来的数字是10010, 那么就拿第一位不为0的作为比较位(因为两个不同的数字异或后肯定有一位是1), 比如这里右数第2位是1作为标记位
        // 然后把原数组右数第2位是0的分成一组, 是1的分成另一组. 这样两个只出现一次的数字就被分到两个数组中了(两个不同的数字在比较位上肯定不同, 这样才会异或得到1). 那些出现了两次的数组也会被分到同一个数组中.
        // 接着异或扫一下两个数组, 每个数组剩下的那个就是只出现一次的.

        var xor = 0
        for e in nums {
            xor = xor ^ e
        }

        // xor就是两个只出现一次的数字, 找出右数第一个数1的位
        var oneIndexFromRight = 0
        while xor & 1 != 1 {
            oneIndexFromRight = oneIndexFromRight + 1
            xor = xor >> 1
        }
        
        //根据oneIndexFromRight, 把数组分成两组
        // var nums1 = [Int](), nums2 = [Int]()  题目要求空间复杂度是O(1), 所以直接在原来的数组上计算即可
        var ret1 = 0, ret2 = 0
        for e in nums {
            if (e >> oneIndexFromRight) & 1 == 0 {
                ret1 = ret1 ^ e
            }else {
                ret2 = ret2 ^ e
            }
        }

        return [ret1, ret2]
    }
}
