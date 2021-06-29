//
//  Solution31.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/18.
//

import Foundation

/*剑指 Offer 31. 栈的压入、弹出序列
 输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如，序列 {1,2,3,4,5} 是某栈的压栈序列，序列 {4,5,3,2,1} 是该压栈序列对应的一个弹出序列，但 {4,3,5,1,2} 就不可能是该压栈序列的弹出序列。

  

 示例 1：

 输入：pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
 输出：true
 解释：我们可以按以下顺序执行：
 push(1), push(2), push(3), push(4), pop() -> 4,
 push(5), pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1
 示例 2：

 输入：pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
 输出：false
 解释：1 不能在 2 之前弹出。
  

 提示：

 0 <= pushed.length == popped.length <= 1000
 0 <= pushed[i], popped[i] < 1000
 pushed 是 popped 的排列。
 注意：本题与主站 946 题相同：https://leetcode-cn.com/problems/validate-stack-sequences/

 通过次数80,888提交次数133,135
 */
class Solution31 {
    let s = Stack<Int>()
    
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        if pushed.count != popped.count {
            return false
        }
        // 入栈前先和出栈数组比较, 不同时入栈, 相同时移除元素以及出栈数组的相同元素, 同时循环检查栈里的元素, 重复这个动作
        var idx = 0
        for e in pushed {
            if e == popped[idx] {
                idx += 1
                while !s.isEmpty && s.top()! == popped[idx] {
                    _ = s.pop()
                    idx += 1
                }
            } else {
                _ = s.push(e)
            }
        }
        // 比较一下出栈数组的元素是不是否被比较完, 若有剩余则返回false
        return idx == popped.count
    }
}

