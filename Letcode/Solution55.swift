//
//  Solution55.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/4/13.
//  Copyright © 2020 Cocos. All rights reserved.
//

import Foundation

class Solution55 {
    var depth = 0
    func maxDepth(_ root: TreeNode?) -> Int {
        var curDepth = 0
        depth(root, &curDepth)
        return depth
    }

    func depth(_ root: TreeNode?, _ curDepth: inout Int) {
        if root == nil {
            return
        }
        curDepth = curDepth + 1
        if curDepth > depth {
            depth = curDepth
        }
        depth(root!.left, &curDepth)
        depth(root!.right, &curDepth)
        curDepth = curDepth - 1
    }
}
