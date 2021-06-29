//
//  Solution36.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/5/24.
//

import Foundation

/*
 剑指 Offer 36. 二叉搜索树与双向链表
 输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的循环双向链表。要求不能创建任何新的节点，只能调整树中节点指针的指向。

  

 为了让您更好地理解问题，以下面的二叉搜索树为例：

  



  

 我们希望将这个二叉搜索树转化为双向循环链表。链表中的每个节点都有一个前驱和后继指针。对于双向循环链表，第一个节点的前驱是最后一个节点，最后一个节点的后继是第一个节点。

 下图展示了上面的二叉搜索树转化成的链表。“head” 表示指向链表中有最小元素的节点。

  



  

 特别地，我们希望可以就地完成转换操作。当转化完成以后，树中节点的左指针需要指向前驱，树中节点的右指针需要指向后继。还需要返回链表中的第一个节点的指针。

  

 注意：本题与主站 426 题相同：https://leetcode-cn.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/

 注意：此题对比原题有改动。

 通过次数72,074提交次数110,236
 */

/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* left;
    Node* right;

    Node() {}

    Node(int _val) {
        val = _val;
        left = NULL;
        right = NULL;
    }

    Node(int _val, Node* _left, Node* _right) {
        val = _val;
        left = _left;
        right = _right;
    }
};
*/
class Solution36 {
    func treeToDoublyList(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let maxNode = _toDublyList(root, nil)
        // 遍历双向链表, 找到最小的, 和最大的
        
        var minNode: TreeNode? = maxNode
        while minNode?.left != nil {
            minNode = minNode?.left
        }
        
        minNode?.left = maxNode
        maxNode?.right = minNode
        
        return minNode
    }
    
    func _toDublyList(_ root: TreeNode?, _ maxNode: TreeNode?) -> TreeNode? {
        if root == nil {
            return maxNode
        }
        
        var maxNode = _toDublyList(root?.left, maxNode)
        if let max = maxNode {
            root?.left = max
            max.right = root
        }
        
        // 转换完左子树之后, 当前根节点就是双向链表的最大节点了, 再把最大的节点传入右子树, 递归处理
        maxNode = root
        if root?.right != nil {
            maxNode = _toDublyList(root?.right, maxNode)
        }
        
        return maxNode
    }
}
