//
//  Solution45.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/7.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution45 {
    func minNumber(_ nums: [Int]) -> String {
        // 把所有数字都转成字符串, 然后放到数组里, 对数组进行排序
        var arrStr = [String]()
        for n in nums {
            arrStr.append(String(n))
        }
        
        arrStr.sort { (s1, s2) -> Bool in
            return s1+s2 < s2+s1
        }
        return arrStr.joined()
    }
}
