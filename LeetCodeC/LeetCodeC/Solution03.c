//
//  Solution03.c
//  LeetCodeC
//
//  Created by Cocos on 2021/4/22.
//

/*
 找出数组中重复的数字。


 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

 示例 1：

 输入：
 [2, 3, 1, 0, 2, 5, 3]
 输出：2 或 3
  

 限制：

 2 <= n <= 100000



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

#include "Solution03.h"

/*
 解题思路:
 因为所有数字都在0到(n-1)范围内, 刚好不出数组下标范围,
 所以遍历一遍数组, 把元素值放到对应下标位置(比如数字5放到下标5的位置), 如果放置前, 对应位置的元素和自己相等则表示是重复数字.
 每次交换元素之后, 都需要重头开始遍历, 避免被交换的元素扰乱了秩序(错了,实际上因为必定有重复, 所以只需要遍历一遍, 就总能把元素换到发现重复的情况)
 */
int findRepeatNumber(int *nums, int numsSize) {
    if (numsSize == 0) {
        return 0;
    }
    
    int i = 0;
    for (i = 0; i < numsSize; i++) {
        int ele = nums[i];
        // 元素已经在对应位置时, 跳过查找下一个
        if (ele == i) {
            continue;
        }
        
        if (ele == nums[ele]) {
            return ele;
        }
        
        Swap(nums, i, ele);
    }

    return 0;
}
