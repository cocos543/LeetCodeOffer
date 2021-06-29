//
//  Solution58.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/18.
//

import Foundation
/*
 剑指 Offer 58 - I. 翻转单词顺序
 输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。

  

 示例 1：

 输入: "the sky is blue"
 输出: "blue is sky the"
 示例 2：

 输入: "  hello world!  "
 输出: "world! hello"
 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 示例 3：

 输入: "a good   example"
 输出: "example good a"
 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
  

 说明：

 无空格字符构成一个单词。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 注意：本题与主站 151 题相同：https://leetcode-cn.com/problems/reverse-words-in-a-string/

 注意：此题对比原题有改动

 通过次数99,793提交次数226,704
 */
class Solution58 {
    func reverseWords(_ s: String) -> String {
        if s.count == 0 {
            return s
        }
        
        let sArr = Array(s)
        
        // 反转顺序的题目, 可以采用递归处理
        // 不过这个题目递归会超时, 直接用栈存储
        let stack = Stack<String>()
    
        
        var word = ""
        var space = false
        for i in 0 ..< sArr.count {
            if sArr[i] != " " {
                word += String(sArr[i])
            } else {
                space = true
                // 如果连续遇到空格的, 直接跳过
                if word.count == 0 {
                    space = false
                    continue
                }
            }
            
            if space || (word != "" && i == sArr.count - 1) {
                _ = stack.push(word)
                word = ""
                space = false
            }
        }
        
        var res = ""
        while !stack.isEmpty {
            if res == "" {
                res = stack.pop()!
            } else {
                res = res + " " + stack.pop()!
            }
            
        }
        return res
    }
    
    // 递归会超时
    func _reverseWords(_ s: String) -> String {
        var word = ""
        var space = false
        for i in 0 ..< s.count {
            if s[i] != " " {
                word += String(s[i])
            } else {
                space = true
                // 如果连续遇到空格的, 直接跳过
                if word.count == 0 {
                    space = false
                    continue
                }
            }
            
            if space {
                let ret = _reverseWords(s[i+1 ..< s.count])
                if ret != "" {
                    word = ret + " " + word
                }
                break
            }
        }
        
        return word
    }
}
