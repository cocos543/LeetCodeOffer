//
//  Solution36.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/5/20.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

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

// 二叉搜索树转成循环双向链表
/*
class Solution {
public:

    Node* treeToDoublyList(Node* root) {
        // 站在根节点的角度思考问题. 右子树会有一个节点是根节点的next, 这个节点就是右子树中最小的那个节点(右子树最靠左的节点)
        // 左子树也有一个节点会是根节点的prev, 那就是左子树中最右的节点.
        // 所以问题可以分解成, 求得左子树的最大节点, 和右子树的最小节点, 这样在让root分别连接这两个节点, 皆可构成双向链表
        // 实现上可以简化一下, 转换左子树之后, 获取到左子树最大节点, 和根节点合成链表之后, 根节点就是链表最后一个节点
        // 再处理右子树,
        if (root == NULL) {
            return root;
        }

        // 开始转换
        Node *maxNode = makeTreeToList(root, NULL);

        // 让转换后的双向链表构成循环链表
        // maxNode指向队尾了, 只需要再找到队头原始, 让他和队尾连在一起即可, 并且返回队头
        Node *minNode = maxNode;
        while (true) {
            if (minNode->left != NULL) {
                minNode = minNode->left;
            }else {
                break;
            }
        }

        minNode->left = maxNode;
        maxNode->right = minNode;
        return minNode;
    }

    // 传入已经转换好的链表的最后一个节点(最大值)
    Node* makeTreeToList(Node *root, Node *maxNode) {
        if(root == NULL) {
            return maxNode;
        }

        maxNode = makeTreeToList(root->left, maxNode);

        root->left = maxNode;
        if (maxNode != NULL) {
            maxNode->right = root;
        }
        // root变成最大的节点了
        maxNode = root;

        // 开始转换右子树
        maxNode = makeTreeToList(root->right, maxNode);

        return maxNode;
    }









    Node* treeToDoublyList2(Node* root) {
        if (root == NULL) {
            return root;
        }
        
        // 先定义两个指针, 用来指向最小和最大节点, 处理完成后, 最小和最大的节点要连在一起构成循环链表, 并返回最小的节点
        Node *minNode, *maxNode;

        // 开始处理, 这道题可以用分解子问题的算法, 递归处理左右子树, 把左右子树先转成双向链表
        maxNode = treeToList2(root, NULL);
        
        // 双向链表已经转好了, 那么得到第一个节点先
        minNode = maxNode;

        while (minNode->left != NULL) {
            minNode = minNode->left;
        }

        // 记得题目要求是循环双向链表, 那么最大最小值还需要连一起
        maxNode->right = minNode;
        minNode->left = maxNode;

        return minNode;
    }

    // 负责把树转成链表, 返回链表最后一个节点
    Node* treeToList2(Node *root, Node *maxNode) {
        if (root == NULL) {
            return maxNode;
        }

        if (root->left != NULL) {
            // 递归查找左子树
            maxNode = treeToList2(root->left, maxNode);
        }
        // 不存在左子树了, 那么root就是剩下的节点中最小的一个, 就直接和链表最后一个节点连接即可
        root->left = maxNode;
        
        // 既然root已经加入链表了, 那么maxNode就需要指向root
        if (maxNode != NULL) {
            maxNode->right = root;
        }

        // root成为了链表最后一个节点了
        maxNode = root;

        if (root->right != NULL) {
            // 继续递归右子树
            maxNode = treeToList2(root->right, maxNode);
        }
        return maxNode;
    }

};
*/
