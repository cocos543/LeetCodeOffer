//
//  Solution22.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/12.
//

import Foundation
/*
 剑指 Offer 22. 链表中倒数第k个节点
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。

 例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 k = 2.

 返回链表 4->5.
 通过次数168,027提交次数213,767
 */
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
class Solution22 {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 || head == nil {
            return nil
        }

        var p = head
        var i = 1
        while i != k {
            if p?.next == nil {
                return nil
            }
            p = p?.next
            i += 1
        }
        var ret = head
        while p?.next != nil {
            ret = ret?.next
            p = p?.next
        }
        return ret
    }
}
