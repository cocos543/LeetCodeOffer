//
//  Solution58.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/17.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题58 - I. 翻转单词顺序
 
 输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。

  

 示例 1：

 输入: "the sky is blue"
 输出: "blue is sky the"
 示例 2：

 输入: "  hello world!  "
 输出: "world! hello"
 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 示例 3：

 输入: "a good   example"
 输出: "example good a"
 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution58 {
    func reverseWords(_ s: String) -> String {
        // 按照空格拆分成多个单词, 然后再从最后一个单词开始拼接每一个单词, 单词和单词之间用空格分开
        var retArr = [String]()
        var subStr = ""
        var sArr = Array(s)
        for c in sArr {
            if c == " " {
                if subStr.count > 0 {
                    retArr.append(subStr)
                    subStr = ""
                }
            }else {
                subStr.append(c)
            }
        }
        if subStr.count > 0 {
            retArr.append(subStr)
        }
        
        return retArr.reversed().joined(separator: " ")
    }
}
