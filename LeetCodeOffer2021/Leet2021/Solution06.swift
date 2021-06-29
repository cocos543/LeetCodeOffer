//
//  Solution06.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/23.
//

import Foundation

class Solution06 {
    /*
     思路1: 是用递归, 递归到最后一个节点再往回打印, 不过容易爆栈
     思路2: 用栈实现
     */
    func reversePrint(_ head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        
        var p = head
        var arr: [Int] = []
        while p != nil {
            arr.append(p!.val)
            p = p!.next
        }
        
        return arr.reversed()
    }
}
