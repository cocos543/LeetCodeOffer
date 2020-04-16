//
//  Solution17.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/30.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution17 {
    func printNumbers(_ n: Int) -> [Int] {
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
