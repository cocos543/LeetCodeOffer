//
//  Solution38.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/5.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

// 这个题解可以看一下
// https://leetcode-cn.com/problems/permutations/solution/hui-su-suan-fa-xiang-jie-by-labuladong-2/
class Solution38 {
    var result: [String] = []
    
    func permutation(_ s: String) -> [String] {
        // 去重用集合实现的, 不好
        
        if s.count == 0 {
            return [""]
        }
        
        _permutation(s.sorted(), 0)
        
        // 结果放到集合中去重..
        var set: Set<String> = [];
        for s in result {
            set.insert(s)
        }
        
        return Array(set)
    }
    
    //把问题拆分成对从begin开始的子字符串进行排列
    func _permutation(_ sArr: [Character], _ begin: Int) {
        if begin == sArr.count - 1 {
            result.append(String(sArr))
            return
        }
        
        var sArr = sArr
        
        
        for i in begin ..< sArr.count {
            
            // 交换s[begin]和s[i]
            var temp = sArr[begin]
            sArr[begin] = sArr[i]
            sArr[i] = temp
            
            _permutation(sArr, begin + 1)
            
            // 恢复数组
            temp = sArr[begin]
            sArr[begin] = sArr[i]
            sArr[i] = temp
            
        }
    }
}
