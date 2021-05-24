#import <Foundation/Foundation.h>
#import "Node.h"

@implementation Node

-(instancetype)initWithValue:(NSNumber *) value {
    self = [super init];
        if (self != nil) {
            _num = value;
            _left = NULL;
            _right = NULL;
        }
    return self;
}

+ (Node *) createTree:(NSMutableArray *)binaryTreeRawData {
    if ([binaryTreeRawData count] == 0) {
        return  nil;
    }

    id object = binaryTreeRawData[0];
    [binaryTreeRawData removeObjectAtIndex:0];
    if (object == [NSNull null]) {
        return  nil;
    }

    Node *root = [[Node alloc] initWithValue:object];
    root.left  = [Node createTree:binaryTreeRawData];
    
    root.right = [Node createTree:binaryTreeRawData];
    
    return  root;
}

//- (NSArray *) dataFromBinaryTree:(Node *)root {
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    [array addObject: [NSMutableArray arrayWithObject:root.num]];
//    NSMutableArray *arrayTmp = [[NSMutableArray alloc] init];
//
//    if(root.left != NULL){
//        [arrayTmp addObject:[root dataFromBinaryTree: root.left]];
//    }
//
//    if(root.right != NULL){
//        [root dataFromBinaryTree: root.right];
//    }
//    if (arrayTmp != 0) {
//        [array addObject:arrayTmp];
//    }
//
//    return array;
//}

-(NSArray*) getLevelOrder:(Node*) root
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    int h = [root height:root];
    int i;
    for (i = 1; i <= h; i++) {
        id object = [root getCurrentLevel:root level:i];

        if (object != nil) {
            
            [array addObject: object];
        }
        
    }
    return array;
}
 
- (NSArray*) getCurrentLevel:(Node*) root level:(int) level
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if (root == NULL)
        return nil;
    if(level == 1) {
        [array addObject:root.num];
    }
    else if (level > 1)
    {
        id objectLeft = [root getCurrentLevel:root.left level:level-1];
        if(objectLeft != nil) {
            [array addObjectsFromArray:objectLeft];
        }
        id objectRight = [root getCurrentLevel:root.right level: level-1];
        if(objectRight != nil) {
            [array addObjectsFromArray:objectRight];
        }
    }
    
    return array;
}

- (int) height:(Node*) root
{
    if (root == NULL)
        return 0;
    else
    {
        int lheight = [root height: root.left];
        int rheight = [root height: root.right];
        
        if (lheight > rheight)
        {
            return(lheight + 1);
        }
        else {
            return(rheight + 1);
        }
    }
}

@end
