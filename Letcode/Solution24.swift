//
//  Solution24.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/5/9.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution24 {

    func reverseList(_ head: ListNode?) -> ListNode? {
        // 经典的题目, 用两个指针, 一个指向反转之后的链头, 一个指向未反转的部分
        if head == nil {
            return head
        }

        var p1: ListNode? = nil, p2 = head
        while p2 != nil {
            let t = p2!.next
            p2!.next = p1
            p1 = p2
            p2 = t
        }
        return p1
    }

    func reverseList2(_ head: ListNode?) -> ListNode? {
        // 第一个指针p1指向反转后的链表第一个节点
        // 第二个指针p2指向还未反转部分的链表的第一个节点

        // 链表为空或者只有一个节点的, 不需要处理了
        if head == nil || head!.next == nil{
            return head
        }

        var p1: ListNode? = nil, p2 = head
        while p2 != nil {
            let temp = p2!.next
            p2!.next = p1
            p1 = p2
            p2 = temp
        }

        return p1
    }
}
