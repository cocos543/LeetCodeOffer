//
//  Solution66.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/25.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution66 {
    func constructArr(_ a: [Int]) -> [Int] {
        if a.count == 0 {
            return [Int]()
        }
        if a.count == 1 {
            return [1]
        }
        // 把B的每个元素都看成CD两部分相乘
        // C[i] = A[0] ... * ... A[i-1]
        // D[i] = A[i+1] ... * ... A[n-1]
        // 这样C[i] = C[i-1] * A[i-1], D[i] =  A[i+1]*D[i+1]
        var b = Array(repeating:0, count: a.count)
        
        // 先计算C数组部分, 直接存入b中, 这样做就不需要额外用两个数组存放c,d的数据了
        // C[0]实际上是不存在的, 所以直接设置为0
        b[0] = 1
        for i in 1 ..< a.count {
            b[i] = b[i-1] * a[i-1]
        }
        
        // 在计算D数组部分, 从后往前算, 最后一个D[n-1]是不存在的, 所以直接用1代替
        var t = 1
        for i in stride(from: a.count-2, through: 0, by: -1) {
            t =  a[i+1]*t
            b[i] *= t
        }
        return b
    }
}
