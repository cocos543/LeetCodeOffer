//
//  ViewController.swift
//  LetcodeOffer
//
//  Created by Cocos on 2020/3/9.
//  Copyright © 2020 Cocos. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var lazyname = Studen().name
    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(#function)###\(name)")
    }
}

class Studen {
    var name: String {
        print("Big1")

        return "Big"
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view

        let node5 = TreeNode(5)
        let node6 = TreeNode(8)
        let node7 = TreeNode(7)
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)

        node1.left = node2
        node1.right = node3
        node2.left = node4

        let s = Solution33()
        print(s.verifyPostorder([4, 6, 7, 5]))

        
        let nums = [-2,1,-3,4,-1,2,1,-5,4]

        var max = -2147483648
        var curMax = -2147483648
        for i in 0 ..< nums.count {
            if curMax <= 0 {
                // 计算的数组重置成从i开始
                curMax = nums[i]
            }else {
                curMax = curMax + nums[i]
            }
            
            if curMax > max {
                max = curMax
            }
        }

        print(max)
        
    }
}
