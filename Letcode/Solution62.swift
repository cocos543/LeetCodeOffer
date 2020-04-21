//
//  Solution62.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/21.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation


/*
 面试题62. 圆圈中最后剩下的数字
 
 0,1,,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字。求出这个圆圈里剩下的最后一个数字。

 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。

  

 示例 1：

 输入: n = 5, m = 3
 输出: 3
 示例 2：

 输入: n = 10, m = 17
 输出: 2
  

 限制：

 1 <= n <= 10^5
 1 <= m <= 10^6
 通过次数26,150提交次数43,133

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution62 {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        // 这道题没有时间复杂度要求, 直接用一个数组模拟循环链表
        if n <= 1 {
            return 0
        }

        var list = Array(0 ..< n)
        var cur = 0
        while list.count != 1 {
            // 假设m=3, 从0开始删除的是2, 所以删除的下标实际上是m-1
            cur = (cur + m - 1) % list.count
            list.remove(at: cur)
        }
        return list[0]
    }
}
