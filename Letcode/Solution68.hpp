//
//  Solution68.hpp
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/27.
//  Copyright © 2020 Cocos. All rights reserved.
//

#ifndef Solution68_hpp
#define Solution68_hpp

#include <stdio.h>

#endif /* Solution68_hpp */

/*
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
         // 因为是二叉搜索树, 所以如果p和q分别位于root的左右子树里, 那么root就是p和q的最近公共祖先.
         // p和q都在root的左(右)子树上, 则root是p和q的祖先, 但不一定是最近的祖先, 所以需要继续往下查找
         if (root == NULL) {
             return NULL;
         }
         
         // 如果p和q都比root大或者小, 则往下找, 否则就返回root了
         if (root->val < p->val && root->val < q->val) {
             return lowestCommonAncestor(root->right, p, q);
         }else if (root->val > p->val && root->val > q->val) {
             return lowestCommonAncestor(root->left, p, q);
         }
         // 如果p或者q等于root, 也会走到这里来的, 所以符合要求.
         return root;
     }
 };
 */
