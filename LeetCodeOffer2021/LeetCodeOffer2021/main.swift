//
//  main.swift
//  LeetCodeOffer2021
//
//  Created by Cocos on 2021/4/23.
//

import Foundation

print("Hello, World!")

let t1 = TreeNode(1)
let t2 = TreeNode(2)
let t3 = TreeNode(3)
let t4 = TreeNode(4)
t1.left = t2
t1.right = t3
t2.left = t4

let t33 = TreeNode(3)

protocol Widget {
    init()
}

struct SwiftRocks: Widget {
   static let author = "Bruno Rocha"
   func postArticle(name: String) {}
}

func createWidget<T: Widget>(ofType: T.Type) -> T {
     let widget = T.init()
     
     return widget
}

let blog: SwiftRocks = SwiftRocks()

let something = type(of: blog)
let ins = createWidget(ofType: SwiftRocks.self)
let ins2 = createWidget(ofType: something)
print(ins)
print(ins2)

print(SwiftRocks.self.self.self.author)
