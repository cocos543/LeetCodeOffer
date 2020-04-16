//
//  Solution46.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/8.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*

 面试题46. 把数字翻译成字符串

 给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

  

 示例 1:

 输入: 12258
 输出: 5
 解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
  

 提示：

 0 <= num < 231

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */
class Solution46 {
    func translateNum(_ num: Int) -> Int {
        return translate(num)
    }

    func translate(_ num: Int) -> Int {
        if num < 10 {
            return 1
        }
        
        // 从后往前找
        // 取数字后两位, 看看是不是在10~25之间, 如果是的话, 说明翻译次数就多了一次
        let r2 = num % 100
        if 10 <= r2 && r2 <= 25 {
            // 处于10~25区间的, 说明翻译次数多一次, 所以下面用加法, 同时把后两位直接去掉继续递归
            // 这里才开两个递归, 其实就是为了次数可以+1,每拆一次意味着结果会+1
            return translate(num / 10) + translate(num / 100)
        } else {
            // 如果不是10~25这个区间的, 那么就不需要增加翻译次数了
            return translate(num / 10)
        }
    }
}
