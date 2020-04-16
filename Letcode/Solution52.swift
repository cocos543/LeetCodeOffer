//
//  Solution52.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/11.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation


/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution52 {
    
    func getIntersectionNode(_ headA: ListNode, _ headB: ListNode) -> ListNode? {
        // 把两条链的节点放到两个栈里, 完成后栈顶元素就是链表的最后一个节点,
        // 接着再同时出栈, 如果栈顶不同则没有交集, 如果栈顶相同, 出栈过程中第一次遇到两个节点不同的, 则前一个出栈的节点就是公共节点了..
        // 不过这道题要求空间复杂度是O(1),所以需要用双指针检测相遇法
        
        return nil;
    }
}
