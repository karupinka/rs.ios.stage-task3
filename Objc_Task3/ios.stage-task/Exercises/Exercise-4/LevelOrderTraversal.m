#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray *resultTree = [[NSMutableArray alloc] init];
    NSMutableArray *resultCompleteTree = [[NSMutableArray alloc] init];

    __block bool nextLine = true;
    __block bool isNullLast = false;
    __block int row = -1;
    __block int countOfNilOfLastString = 0;
    __block int countOfNumbersInRow = 0;

    [tree enumerateObjectsUsingBlock:^(id  number, NSUInteger idx, BOOL *stop){

        if ([number isKindOfClass:NSNumber.class]) {
            if(nextLine) {
                [resultTree addObject:[NSMutableArray arrayWithObject: number]];
                row += 1;
            } else {
                [resultTree[row] addObject:number];
            }
            countOfNilOfLastString = 0;
            countOfNumbersInRow += 1;
            isNullLast = false;
        }

        else if ([number isKindOfClass:NSNull.class]) {
            isNullLast = true;
            row += 1;
            countOfNilOfLastString += 1;
            countOfNumbersInRow = 0;
        }

        if (isNullLast && countOfNilOfLastString == 1) {
            row -= 1;
            nextLine = true;
        }
        if (isNullLast && countOfNilOfLastString == 2) {
            row -= 1;
            nextLine = false;
        }
        if (row * 2 == countOfNumbersInRow) {
            nextLine = true;
        }
    }];
    
    return resultTree;
}
