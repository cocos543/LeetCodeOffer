//
//  Solution27.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/1.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

/*
 请完成一个函数，输入一个二叉树，该函数输出它的镜像。

 例如输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 镜像输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

  

 示例 1：

 输入：root = [4,2,7,1,3,6,9]
 输出：[4,7,2,9,6,3,1]
  

 限制：

 0 <= 节点个数 <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-shu-de-jing-xiang-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution27 {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        // 比较简单, 当前节点的左节点等于右节点, 右节点等于左节点即可. 然后递归处理各个子节点
        if root == nil {
            return nil
        }

        let tmp = root!.left
        root!.left = mirrorTree(root!.right)
        root!.right = mirrorTree(tmp)

        return root
    }
}
