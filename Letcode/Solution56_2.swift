//
//  Solution56_2.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/15.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 
 在一个数组 nums 中除一个数字只出现一次之外，其他数字都出现了三次。请找出那个只出现一次的数字。

  

 示例 1：

 输入：nums = [3,4,3,3]
 输出：4
 示例 2：

 输入：nums = [9,1,7,9,7,9,7]
 输出：1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution56_2 {
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        // 高效的解法就是, 把每个元素的每个bit都和另一个元素对应的bit加起来放到一起, 这样出现三次的元素, 全部加起来的位就可以被3整除.
        // 那个只出现1次的数字, 对应的位就是0; 剩下的不能被3整除的位, 只出现1次的数字对应的位就是1

        // 第二种解法, 就是弄一个哈希表把所有数字作为key存进去, value就是出现的次数, 最后遍历一下哈希表得到只出现一次的数组

        // 第三种解法就是排序, 然后再找出只出现一次的数字..

        // 这里时间关系就用第二种解法了...
        var map = [Int: Int]()
        for e in nums {
            if map[e] == nil {
                map[e] = 1
            }else {
                map[e] = 1 + map[e]!
            }
        }

        for (k,v) in map {
            if v == 1 {
                return k
            }
        }
        return 0
    }
}
