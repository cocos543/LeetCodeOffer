//
//  Solution25.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/13.
//

import Foundation

/*
 剑指 Offer 25. 合并两个排序的链表
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

 示例1：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 限制：

 0 <= 链表长度 <= 1000

 注意：本题与主站 21 题相同：https://leetcode-cn.com/problems/merge-two-sorted-lists/

 通过次数130,139提交次数178,844
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
class Solution25 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 合并到最后, 会有一条链有剩余, 则直接并入有序链表中即可
        var l1 = l1, l2 = l2
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var head: ListNode?
        if l1!.val > l2!.val {
            head = l2
            l2 = l2?.next
        }else {
            head = l1
            l1 = l1?.next
        }
        
        var p = head!
        while l1 != nil && l2 != nil {
            if l1!.val > l2!.val {
                p.next = l2
                p = l2!
                l2 = l2?.next
            }else {
                p.next = l1
                p = l1!
                l1 = l1?.next
            }
        }
        
        if l1 == nil {
            p.next = l2
        }else {
            p.next = l1
        }
        
        return head
    }
}
