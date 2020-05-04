//
//  RecursionArrayIterator.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/5/4.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

// 嵌套数组的迭代器
// [1,[2,3],4,5,6], 可以通过next方法, 迭代出1,2,3,4,5,6;
class RecursionArrayIterator: NSObject {
    // 当前迭代器游标
    private var cur = 0
    private var array: [Any]
    
    // 当前cur可能获取到的是数组, 则创建迭代器递归处理
    private var curIterator: RecursionArrayIterator?
    init(_ array: [Any]) {
        self.array = array
    }
    
    func allObjects() -> [Int] {
        var ans = [Int]()
        while let e = next() {
            ans.append(e)
        }
        return ans
    }
    
    func next() -> Int? {
        if cur < array.count {
            let ele = array[cur]
            if (ele as? Array<Any>) != nil || (curIterator != nil) {
                if curIterator == nil {
                    let arr = ele as! Array<Any>
                    curIterator = RecursionArrayIterator(arr)
                }
                let ans = curIterator?.next()
                if ans != nil {
                    return ans
                }else {
                    // 递归迭代器没元素了, 直接访问cur的下一个元素
                    curIterator = nil
                    cur += 1
                    return next()
                }
            }
            cur += 1
            return ele as? Int
        }
        return nil
    }
}
