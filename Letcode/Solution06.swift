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
 *
 *
 */

/*
 
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

 示例 1：

 输入：head = [1,3,2]
 输出：[2,3,1]
  

 限制：

 0 <= 链表长度 <= 10000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution06 {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var arr: [Int] = []
        var head = head
        
        while let h = head {
            arr.append(h.val)
            head = h.next
        }
        return arr.reversed()
    }
}
