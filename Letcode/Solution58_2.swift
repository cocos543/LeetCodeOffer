//
//  Solution58_2.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/17.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 面试题58 - II. 左旋转字符串
 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

  

 示例 1：

 输入: s = "abcdefg", k = 2
 输出: "cdefgab"
 示例 2：

 输入: s = "lrloseumgh", k = 6
 输出: "umghlrlose"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution58_2 {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        // 直接的思路, 就是先把p2移动到k的位置, 然后p1指向0, 接着把p1元素取出来, 放到字符串末尾, 不过整个字符串需要往前移动一格(和数组的插入一样)
        // 用高级语言的思路, 就是吧0..<k这个子串拿出来和后面合一起就可以了....
        if n >= s.count {
            return s
        }
        
        let subS = s[s.startIndex ..< s.index(s.startIndex, offsetBy:n)]
        let ret = s[s.index(s.startIndex, offsetBy:n) ..< s.endIndex] + subS
        return String(ret)
    }
}
