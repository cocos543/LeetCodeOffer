//
//  Solution.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/31.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。

  

 示例：

 给定一个链表: 1->2->3->4->5, 和 k = 2.

 返回链表 4->5.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution22 {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 注意一下倒数第k个, k从1开始不是从0, 用快慢指针即可, 比较简单
        if head == nil {
            return head
        }

        var pfast = head
        var pslow = head
        var k = k
        while k > 1 {
            if pfast!.next != nil {
                pfast = pfast!.next
                k -= 1
            }else {
                return nil
            }
        }
        // 这里pfast不可能为空
        while pfast!.next != nil {
            pslow = pslow!.next
            pfast = pfast!.next
        }
        return pslow
    }
    
    func getKthFromEnd2(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 经典的题目, 先让指针p1往后移动k个节点, 然后在创建一个指针p2, p1和p2同时移动, 直到p1为空, p2就是目标节点了
        if head == nil || k == 0 {
            return nil
        }
        
        var k = k
        var plast = head, pk = head
        while k > 0 && plast != nil {
            plast = plast!.next
            k = k - 1
        }
        
        // 处理一下链表长度不够k的情况
        if k > 0 {
            return nil
        }

        while plast != nil {
            plast = plast!.next
            pk = pk!.next
        }
        return pk
    }
}
