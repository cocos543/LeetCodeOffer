//
//  Utils.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/23.
//

import Foundation

// MARK: - 扩展系统的String类, 支持整型下标访问

extension String {
    fileprivate subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

    fileprivate subscript(r: Range<Int>) -> Substring {
        let startIndex = index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: r.upperBound)
        return self[startIndex ..< endIndex]
    }

    fileprivate subscript(r: ClosedRange<Int>) -> Substring {
        let startIndex = index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: r.upperBound)
        return self[startIndex ... endIndex]
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

