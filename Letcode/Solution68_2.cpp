//
//  Solution68_2.cpp
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/28.
//  Copyright © 2020 Cocos. All rights reserved.
//

#include "Solution68_2.hpp"


/*
 面试题68 - II. 二叉树的最近公共祖先
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]



  

 示例 1:

 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 示例 2:

 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出: 5
 解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
  

 说明:

 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉树中。
  * Definition for a binary tree node.
  * struct TreeNode {
  *     int val;
  *     TreeNode *left;
  *     TreeNode *right;
  *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
  * };
 class Solution {
 public:
     TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
         // 目的就是找出root的子节点中哪里包含了p和q, 然后找到最底层的首个符合条件的返回.
         // 这里试用递归后序遍历, 所以第一个符合条件的返回就是答案了.

         // 用后序遍历, 查看root的左右子树是否包含p和q(p和q不在同侧)
         // 终止条件就是当root等于p或者q, 返回root
         if (root == NULL || root->val == p->val || root->val == q->val) {
             return root;
         }
         // 遍历左子树
         TreeNode *left = lowestCommonAncestor(root->left, p, q);
         TreeNode *right = lowestCommonAncestor(root->right, p, q);
         if (left != NULL && right != NULL) {
             return root;
         }
         if (left != NULL) {
             return left;
         }else if (right != NULL) {
             return right;
         }
         return NULL;
     }
 };
 */
