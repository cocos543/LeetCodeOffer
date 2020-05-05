//
//  Solution17.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/30.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution17 {
    // 字符串模拟加法
    func printNumbers(_ n: Int) -> [Int] {
        if n == 0 {
            return [Int]()
        }

        var ans = [Int]()
        var num = Array(repeating: "0", count: n).joined()
        while let ret = numberAdd(num, num2: "1") {
            // 这里就可以打印出ret了.不过还要转成数字返回答题:(
            num = ret
            ans.append(Int(ret)!)
        }
        
        return ans
    }
    
    // Bool表示是否需要停止, 如果传入字符串加1后溢出原来的长度, 则需要停止. 比如最大999, 那么999+1 = 1000 则溢出
    func numberAdd(_ num1: String, num2: String) -> String? {
        // swift不太好做...先把字符串转成Character
        // 低位在左高位在右, 方便计算
        // swift代码量这么多. 手写是个问题...
        let numArr1 = Array(num1.reversed()), numArr2 = Array(num2.reversed())
        var carry = 0
        var index = 0
        var ans = numArr1.count > numArr2.count ? numArr1 : numArr2
        while index < numArr1.count || index < numArr2.count {
            var sum = 0
            if index < numArr1.count && index < numArr2.count {
                sum = Int("\(numArr1[0])")! + Int("\(numArr2[index])")!
            } else if index < numArr1.count {
                sum = Int("\(numArr1[index])")!
            } else {
                sum = Int("\(numArr2[index])")!
            }
            ans[index] = Character("\((sum + carry) % 10)")
            carry = (sum + carry) / 10
            index += 1
        }
        
        // 如果最后还有进位则表示溢出了
        if carry == 0 {
            return Array(ans.reversed()).reduce("") { $0+String($1) }
        }else {
            return nil
        }
    }

    func printNumbers2(_ n: Int) -> [Int] {
        var n = n
        var count = 1
        while n > 0 {
            count = count * 10
            n = n - 1
        }

        var arr = [Int]()
        for i in 1 ..< count {
            arr.append(i)
        }
        return arr
    }
}
