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
    var result = [String]()
    var result2 = Set<String>()

    func permutation(_ s: String) -> [String] {
        if s.count == 0 {
            return [""]
        }
        
        // 先排序, 再用集合去重...
        var arr = Array(s)
        permutationAction(&arr, 0, s.count - 1)
        return Array(result2)
    }

    func permutationAction(_ arr: inout [Character], _ begin: Int, _ end: Int) {
        if begin >= end {
            result2.insert(String(arr))
            return
        }
        for i in begin ... end {
            var t = arr[begin]
            arr[begin] = arr[i]
            arr[i] = t

            permutationAction(&arr, begin+1, end)

            t = arr[begin]
            arr[begin] = arr[i]
            arr[i] = t
        }
    }

    func permutation2(_ s: String) -> [String] {
        // 去重用集合实现的, 不好
        
        if s.count == 0 {
            return [""]
        }
        
        _permutation2(s.sorted(), 0)
        
        // 结果放到集合中去重..
        var set: Set<String> = [];
        for s in result {
            set.insert(s)
        }
        
        return Array(set)
    }
    
    //把问题拆分成对从begin开始的子字符串进行排列
    func _permutation2(_ sArr: [Character], _ begin: Int) {
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
            
            _permutation2(sArr, begin + 1)
            
            // 恢复数组
            temp = sArr[begin]
            sArr[begin] = sArr[i]
            sArr[i] = temp
            
        }
    }
}
