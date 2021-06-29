//
//  Solution05.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/23.
//

import Foundation

/*
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

  

 示例 1：

 输入：s = "We are happy."
 输出："We%20are%20happy."
  

 限制：

 0 <= s 的长度 <= 10000



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution005 {
    func replaceSpace(_ s: String) -> String {
        // 创建一个新的足够大的空间容纳修改后的字符串即可.
        // 然后就是一个一个copy到新空间里.
        var newS = ""
        for e in s {
            if e == " " {
                newS.append("%20")
            }else {
                newS.append(e)
            }
        }
        return newS
    }
}
