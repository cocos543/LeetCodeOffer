//
//  Solution52.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/6/5.
//

import Foundation
/*
 剑指 Offer 52. 两个链表的第一个公共节点
 输入两个链表，找出它们的第一个公共节点。

 如下面的两个链表：



 在节点 c1 开始相交。

  

 示例 1：



 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
 输出：Reference of the node with value = 8
 输入解释：相交节点的值为 8 （注意，如果两个列表相交则不能为 0）。从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,0,1,8,4,5]。在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
  

 示例 2：



 输入：intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
 输出：Reference of the node with value = 2
 输入解释：相交节点的值为 2 （注意，如果两个列表相交则不能为 0）。从各自的表头开始算起，链表 A 为 [0,9,1,2,4]，链表 B 为 [3,2,4]。在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。
  

 示例 3：



 输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
 输出：null
 输入解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
 解释：这两个链表不相交，因此返回 null。
  

 注意：

 如果两个链表没有交点，返回 null.
 在返回结果后，两个链表仍须保持原有的结构。
 可假定整个链表结构中没有循环。
 程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存。
 本题与主站 160 题相同：https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
 通过次数112,829提交次数176,969

 */
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
//class Solution {
//public:
//    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
//        
//    }
//};
class Solution52 {
    func getIntersectionNode(headA: ListNode?, headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        
        // 先同时移动, 其中有一个会先到达末尾, 剩下的那个还没到达末尾的, 距离末尾的距离就是长链多出来的节点数, 该位置记做A.
        // 接着再从长链开始记为B, 和A同时移动, A到达末尾时,表示B已经走掉了长链多出来的部分了, 现在可以从短链开始,记作C, B,C同时移动
        // 相遇时, 节点就是第一个公共节点了, 不相遇, 则没有公共节点.
        var p1 = headA
        var p2 = headB
        
        // 如果p1和p2都是nil, 也会跳出循环
        while p1?.val != p2?.val {
            if p1 != nil {
                p1 = p1?.next
            } else {
                p1 = headB
            }
            
            if p2 != nil {
                p2 = p2?.next
            } else {
                p2 = headA
            }
        }
        
        return p1
    }
}
