//
//  Solution20.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/12.
//

import Foundation
/*

 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面

 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。

 示例：

 输入：nums = [1,2,3,4]
 输出：[1,3,2,4]
 注：[3,1,2,4] 也是正确的答案之一。

 提示：

 0 <= nums.length <= 50000
 1 <= nums[i] <= 10000
 通过次数134,867提交次数210,301

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution21 {
    func exchange(_ nums: [Int]) -> [Int] {
        // 借用快排分区思想, 快排分区的条件是找到小于标记的元素, 和标记交换位置, 这里条件变成遇到奇数就和标记交换(标记是左数第一个偶数)
        var nums = nums
        var mark = 0
        for i in 0 ..< nums.count {
            if nums[i] & 1 == 0 {
                continue
            } else {
                if i != mark {
                    let t = nums[i]
                    nums[i] = nums[mark]
                    nums[mark] = t
                }
                mark += 1
            }
        }
        return nums
    }
}
