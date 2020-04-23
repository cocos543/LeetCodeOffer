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
        node5.right = node6
        node5.left = node3

        node6.left = node7

        node3.right = node4
        node3.left = node2
        node2.left = node1

        let s = Solution64()
        print(s.sumNums(9))
    
    }
}
