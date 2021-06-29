//
//  Utils.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/23.
//

import Foundation

// MARK: - 扩展系统的String类, 支持整型下标访问

extension String {
    /// 字符串名[n]: 修改与获取字符串某个字符
    ///
    /// - Parameter index: 下标整数
    subscript(index: Int) -> Character {
        set {
            guard index >= 0 && index < count else {
                assertionFailure("The subscript has beyond [0,\(count - 1)]")
                return
            }
            let startIndex = self.startIndex
            let startPath = self.index(startIndex, offsetBy: index)
            let endPath = self.index(after: startPath)
            let range = startPath ..< endPath
            replaceSubrange(range, with: String(newValue))
        }
        get {
            var character: Character = "0"
            guard index < count else {
                assertionFailure("The subscript has beyond [0,\(count - 1)]")
                return character
            }
            let startIndex = self.startIndex
            let indexPath = self.index(startIndex, offsetBy: index)
            character = self[indexPath]
            return character
        }
    }

    /// 字符串名[n,m]:获取、修改和删除
    ///
    /// - Parameters:
    ///   - startIndex: 下标整数
    ///   - endIndex: 下标整数
    subscript(_ startIndex: Int, _ endIndex: Int) -> String {
        set {
            var min = startIndex
            var max = endIndex
            guard (min >= 0 && min < count) && (max >= 0 && max < count) else {
                assertionFailure("The subscript has beyond [0,\(count - 1)]")
                return
            }
            if min > max {
                (min, max) = (max, min)
            }
            let firstIndex = self.startIndex
            let startPath = index(firstIndex, offsetBy: min)
            let endPath = index(firstIndex, offsetBy: max)
            let range = startPath ... endPath
            replaceSubrange(range, with: newValue)
        }
        get {
            var min = startIndex
            var max = endIndex
            var newString = String()
            guard (min >= 0 && min < count) && (max >= 0 && max < count) else {
                assertionFailure("The subscript has beyond [0,\(count - 1)]")
                return newString
            }
            if min > max {
                (min, max) = (max, min)
            }
            let firstIndex = self.startIndex
            let startPath = index(firstIndex, offsetBy: min)
            let endPath = index(firstIndex, offsetBy: max)
            let range = startPath ... endPath
            newString = String(self[range])
            return newString
        }
    }

    /// 字符串名[n...m]: 获取与修改相应的子串
    ///
    /// - Parameter closeRange: 无符号封闭整型范围
    subscript(_ closeRange: ClosedRange<Int>) -> String {
        set {
            self[closeRange.lowerBound, closeRange.upperBound] = newValue
        }
        get {
            return String(self[closeRange.lowerBound, closeRange.upperBound])
        }
    }

    /// 字符串名[n..<m]: 获取与修改相应的子串
    ///
    /// - Parameter closeRange: 无符号半封闭整型范围
    subscript(_ subRange: Range<Int>) -> String {
        set {
            self[subRange.lowerBound, subRange.upperBound - 1] = newValue
        }
        get {
            if subRange.lowerBound == subRange.upperBound {
                return ""
            }
            return String(self[subRange.lowerBound, subRange.upperBound - 1])
        }
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
    }
}
