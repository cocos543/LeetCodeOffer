//
//  Solution05.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/18.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution05 {
    
    func replaceSpace(_ s: String) -> String {
        if s.count == 0 {
            return s
        }
        var newS = ""
        for ele in s {
            if ele == " " {
                newS.append("%20")
            }else {
                newS.append(ele)
            }
        }
        return newS
    }
    
    /// 空间复杂度是O(n), 时间复杂度O(n)
    /// - Parameter s: 原字符串
    func replaceSpace2(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
        
        var newS = ""
        for c in s {
            if c == " " {
                newS.append("%20")
            }else {
                newS.append(c)
            }
        }
        
        return newS
    }
}
