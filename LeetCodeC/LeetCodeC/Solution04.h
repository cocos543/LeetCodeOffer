//
//  Solution04.h
//  LeetCodeC
//
//  Created by Cocos on 2021/4/22.
//

#ifndef Solution04_h
#define Solution04_h

#include <stdio.h>
/*
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
 */
bool findNumberIn2DArray(int** matrix, int matrixSize, int* matrixColSize, int target);
#endif /* Solution04_h */
