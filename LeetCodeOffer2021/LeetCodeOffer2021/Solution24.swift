//
//  Solution23.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/12.
//

import Foundation
/*
 剑指 Offer 24. 反转链表
 定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

  

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
  

 限制：

 0 <= 节点个数 <= 5000

  

 注意：本题与主站 206 题相同：https://leetcode-cn.com/problems/reverse-linked-list/

 通过次数206,614提交次数279,057
 */
class Solution24 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var rhead: ListNode?
        var p = head
        
        while p != nil {
            let temp = p!.next
            p!.next = rhead
            rhead = p
            p = temp
        }
        return rhead
    }
}
