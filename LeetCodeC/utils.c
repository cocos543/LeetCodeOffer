//
//  utils.c
//  LeetCodeC
//
//  Created by Cocos on 2021/4/22.
//

#include "utils.h"

void Swap(int arr[], int i, int j) {
    int t = arr[i];
    arr[i] = arr[j];
    arr[j] = t;
}
