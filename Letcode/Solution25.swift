//
//  Solution25.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/1.
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
class Solution25 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 跟合并两个有序数组一样, 主要处理合并后的
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var head: ListNode?
        var foot: ListNode?
        var l1 = l1, l2 = l2

        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                if head == nil {
                    head = l1
                }else {
                    foot!.next = l1
                }
                foot = l1
                l1 = l1!.next
            }else {
                if head == nil {
                    head = l2
                }else {
                    foot!.next = l2
                }
                foot = l2
                l2 = l2!.next
            }
        }
        if l1 != nil {
            foot!.next = l1
        }else {
            foot!.next = l2
        }
        return head
    }
    
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 依次挑选出两条链表里面小的节点, 作为新链表的下一个节点插入到新链表末尾即可
        // 主要最后l1, l2 如果还有剩余的节点, 则一次性插入即可

        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }

        var head: ListNode?
        var p: ListNode?
        var l1 = l1, l2 = l2

        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                if head == nil {
                    head = l1
                    l1 = l1!.next
                    p = head
                } else {
                    p!.next = l1
                    p = p!.next
                    l1 = l1!.next
                }
            }else {
                if head == nil {
                    head = l2
                    l2 = l2!.next
                    p = head
                } else {
                    p!.next = l2
                    p = p!.next
                    l2 = l2!.next
                }
            }
        }

        // 把剩下的节点插入到末尾
        if l1 != nil {
            p!.next = l1
        }else if l2 != nil {
            p!.next = l2
        }

        return head
    }
}
