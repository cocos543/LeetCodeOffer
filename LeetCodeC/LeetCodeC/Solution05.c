//
//  Solution005.c
//  LeetCodeC
//
//  Created by Cocos on 2021/4/23.
//

#include "Solution005.h"

/*
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

  

 示例 1：

 输入：s = "We are happy."
 输出："We%20are%20happy."
  

 限制：

 0 <= s 的长度 <= 10000



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
char* replaceSpace(char* s) {
    // 假设s的空间足够容纳替换后的字符数量;
    // 先遍历一遍获取s中所有空格, 接着从右往左遍历字符串, 每遇到一个空格之前的所有字符都需要往右移动2*(剩余空格数)的位置;
    // 随后把3个字符%20插入数组中, 剩余空格数-1, 循环直到剩余空格数为0;
    return s;
}
