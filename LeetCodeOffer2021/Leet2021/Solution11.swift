//
//  Solution11.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/29.
//

import Foundation

/*
 剑指 Offer 11. 旋转数组的最小数字
 
 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。

 示例 1：

 输入：[3,4,5,1,2]
 输出：1
 示例 2：

 输入：[2,2,2,0,1]
 输出：0
 注意：本题与主站 154 题相同：https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array-ii/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution11 {
    // 错误的解法, 无法处理 [10,1,10,10,10]
    func minArray(_ numbers: [Int]) -> Int {
        // 有序数组用二分. 不过这里二分得分情况, 假设输入旋转0个元素, 那就是普通有序数组,
        if numbers.first! < numbers.last! {
            return numbers.first!
        }
        
        // 正题
        // 旋转之后, 数组分成两部分, 左部分(大组)一定会比右部分大(小组)
        // 所以按照二分方式, 中间元素比第一个元素大, 则中间元素在大组内, 所以二分往右找
        // 如果中间元素比第一个元素小, 则中间元素在小组内, 二分往左找
        
        // 特殊情况, 如果二分的start, middle, end 三个位置都一样大, 没法找, 只能把end或者start丢掉后重来
        var start = 0, end = numbers.count - 1
        while start < end {
            let mid = start + (end-start) >> 1
            if numbers[mid] > numbers[start] {
                // mid位于大组中, 这里不用+1, 确保数组规律不变
                start = mid
            }else if numbers[mid] < numbers[start] {
                // mid位于小组中, mid本身可能是最小
                end = mid
            }else {
                // 把start丢了重来
                start += 1
            }
        }
        
        return numbers[start]
    }
    
    // 上面算法有个问题, 比如遇到数组[10,1,10,10,10], 把第一个元素去掉之后,是剩下的就是普通数组了, 按照上面的算法答案错误.
    // 如果让mid和end比较, 则可以排除这种情况. mid比end小时, 说明数组可能是普通数组(或者在小组), 最小元素在左边, 这样就能正确处理普通数组了
    func minArray2(_ numbers: [Int]) -> Int {
        
        var start = 0, end = numbers.count - 1
        while start < end {
            let mid = start + (end-start) >> 1
            if numbers[mid] > numbers[end] {
                // mid位于大组中
                start = mid + 1
            }else if numbers[mid] < numbers[end] {
                // mid比end小, 说明mid可能在小组, 或者数组是一个普通数组
                end = mid
            }else {
                // 把start丢了重来
                end -= 1
            }
        }
        
        return numbers[start]
    }
}
