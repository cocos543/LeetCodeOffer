//
//  Solution35.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/5/18.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

// 复杂链表的复制 C++版本
/*
 /*
 // Definition for a Node.
 class Node {
 public:
     int val;
     Node* next;
     Node* random;
     
     Node(int _val) {
         val = _val;
         next = NULL;
         random = NULL;
     }
 };
 */
 class Solution {
 public:
     Node* copyRandomList(Node* head) {
         // 先直接赋值节点, 并把赋值好的节点放到原节点的next位置(插入进去)
         // 这样整个链表赋值完成后, 原节点的random指针所在的next, 就是对应复制节点的random指针需要指向的位置
         if (head == NULL) {
             return NULL;
         }
         Node *p = head;
         while (p != NULL) {
             // 创建一个新的复制节点
             Node *copyNode = new Node(p->val);
             // 新节点插入原节点之后
             copyNode->next = p->next;
             p->next = copyNode;
             p = copyNode->next;
         }
         p = head;
         // 复制random指针
         while (p != NULL) {
             Node *random = p->random;
             if (random != NULL) {
                 p->next->random = random->next;
             }
             p = p->next->next;
         }

         // 把复制好的链表独立出来
         Node *ans = NULL;
         Node *curCopyNode = NULL;
         p = head;

         while (p != NULL) {
             Node *copyNode = p->next;
             if (ans == NULL) {
                 ans = copyNode;
             }else {
                 curCopyNode->next = copyNode;
             }
             curCopyNode = copyNode;
             p->next = copyNode->next;
             p = p->next;
         }
         return ans;

     }




     Node* copyRandomList2(Node* head) {
         // 先复制节点, 复制的节点插入到被复制节点的后面. 这样原链表的random指针指向的节点的next, 也会是复制链表的对应的random指针指向的节点.
         // 比如 A-B-C-D-E, 先复制每一个节点, 完成后就变成A-A`-B-B`-C-C`-D-D`-E-E`
         // 假如A的random指针指向C, 那么A`的random指针就是指向C.next, 很好理解吧..最后再把复制出的节点重新链接到一条链上即可
         if (head == NULL) {
             return NULL;
         }

         // 先复制节点
         copyNextNodeList2(head);
         // 再复制Random节点
         copyRandomNodeList2(head);

         // 最后把偶数位置的节点单独取出来, 就是复制好的链表了
         Node *p = head;
         Node *pCopyHead, *p1;

         while (p != NULL) {
             if (p1 == NULL) {
                 p1 = p->next;
                 pCopyHead = p1;
             }else {
                 p1->next = p->next;
                 p1 = p1->next;
             }
             // 链接好原始链表
             p->next = p->next->next;
             p = p->next;
         }

         return pCopyHead;
     }

     void copyNextNodeList2(Node *head) {
         Node *p = head;
         while (p != NULL) {
             Node *newNode = new Node(p->val);
             // 新节点插入到被复制节点的后面
             newNode->next = p->next;
             p->next = newNode;
             p = p->next->next;
         }
     }

     void copyRandomNodeList2(Node *head) {
         Node *p = head;
         while (p != NULL) {
             Node *p1 = p->next;
             if (p->random != NULL) {
                 p1->random = p->random->next;
             }
             p = p->next->next;
         }
     }
 };
 */
