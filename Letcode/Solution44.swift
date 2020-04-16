//
//  Solution44.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/7.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution44 {
    func findNthDigit(_ n: Int) -> Int {
        // 找规律,  1位数的有10个
        // 2位数的, 10-99, 一共90个
        // 3位数的, 100-999, 一共900个
        // 4位数的, 1000-9999, 一共9000个
        // 可以看出规律了, 先写一个函数, 传入位数, 返回有多少个数字
        if n < 0 {
            return -1
        }
        
        var digits = 1
        var n = n
        while true {
            let count = countOfIntegers(digits)
            // 比如n是1001, digits=1时, count有10位, n比count大, 说明要在10位数之后, 找991(也就是1001-10)位数
            if n < count * digits {
                return digitAtIndex(n, digits)
            }
            n = n - count * digits
            digits = digits + 1
        }
    }
    
    func countOfIntegers(_ digits: Int) -> Int {
        if digits == 1 {
            return 10
        }
        return Int(pow(10, Double(digits - 1))) * 9
    }
    
    func digitAtIndex(_ n: Int, _ digits: Int) -> Int {
        // 先得到digits位的数字, 第一个是多少
        var first = 0
        if digits > 1 {
            // 例如digits=2, 那么first=10
            first = Int(pow(10, Double(digits - 1)))
        }
        // 根据位数, 计算出n这个数字一共占用多少个数
        // 比如n是12(意思就是n在first这个数字之后的12位上), 假设digist是2, 那么从10这个数字开始, 还需要跳过12/2=6个数字
        // 12这个位置, 就坐落到10+6 = 16这个数字上
        var number = first + n / digits
        
        // 得到16这个数字之后, 再计算出n是在16的哪一位上
        // indexFromRight 表示数字在16的右数哪一位 , 这样可以通过让number/10, 得到具体的数字出来
        let indexFromRight = digits - n % digits
        for i in 1 ..< indexFromRight {
            number = number / 10
        }
        
        return number % 10
    }
}
