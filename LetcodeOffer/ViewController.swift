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
        

        let s = Solution32_3()
        print(s.levelOrder(node1))
        var a = [1,2,3,4]
        var arr = [[Int]]()
        arr.append(Array(a.reversed()))
        print(arr)
    
    }
}
