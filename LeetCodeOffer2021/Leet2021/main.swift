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
let t5 = TreeNode(5)
let t6 = TreeNode(6)

t5.right = t6
t5.left = t3
t3.left = t2
t3.right = t4
t2.left = t1

let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
let l4 = ListNode(4)
let l5 = ListNode(5)
let l6 = ListNode(6)
let l7 = ListNode(7)
let l8 = ListNode(8)
l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
l5.next = l6

l7.next = l8

print(Solution61().isStraight([0, 0, 8, 5, 4]))

protocol Widget {
    init()
}

struct SwiftRocks: Widget {
    static let author = "Bruno Rocha"
    func postArticle(name: String) {}
}

func createWidget<T: Widget>(ofType: T.Type) -> T {
    let widget = T()

    return widget
}

let blog: SwiftRocks = SwiftRocks()

let something = type(of: blog)
let ins = createWidget(ofType: SwiftRocks.self)
let ins2 = createWidget(ofType: something)
print(ins)
print(ins2)

print(SwiftRocks.author)
