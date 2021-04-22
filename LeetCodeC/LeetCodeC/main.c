//
//  main.c
//  LeetCodeC
//
//  Created by Cocos on 2021/4/22.
//

#include <stdio.h>
#include "Solution04.h"

int main(int argc, const char *argv[]) {
    // insert code here...
    int arr[5][5] =  {
        { 1,  4,  7,  11,  15    },
        { 2,  5,  8,  12,  19    },
        { 3,  6,  9,  16,  22    },
        { 10, 13, 14, 17,  24    },
        { 18, 21, 23, 26,  30    }
    };
    int col = 5;
    int a = findNumberIn2DArray((int **)arr, 5, &col, 5);
    printf("%d\n", a);
    return 0;
}
