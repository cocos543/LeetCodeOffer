//
//  Solution11.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/28.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题11. 旋转数组的最小数字

 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。

 示例 1：

 输入：[3,4,5,1,2]
 输出：1
 示例 2：

 输入：[2,2,2,0,1]
 输出：0

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution11 {
    func minArray(_ numbers: [Int]) -> Int {
        // 这种题目, 数组基本是有序的, 所以可以用二分查找的思想, 但是需要额外处理查找的特殊情况

        var l = 0, r = numbers.count - 1
        while l < r {
            
            // 防止和太大溢出
            let m = l + (r - l) / 2
            
            // 递增数组中, 注意如果数组没有被旋转过, 那么中位数肯定也比arr[l]大, 但是最小数是在左边. 所以中位数和arr[r]对比
            // 为了防止这种情况, 对比的时候,先让arr[m]和arr[r]对比 ,如果arr[m]比arr[r]的元素大,说明最小元素肯定被渲染到右边去了.
            // 否则就在左边
            if numbers[m] > numbers[r] {
                l = m + 1
            } else if numbers[m] < numbers[r] {
                r = m
            }else {
                // 遇到重复元素, 去最后一个元素去掉, 重新查找
                r = r - 1
            }
        }
        return numbers[l]
    }
}
