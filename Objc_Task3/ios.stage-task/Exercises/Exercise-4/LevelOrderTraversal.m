#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    Node *node = [Node createTree:[tree mutableCopy]];
    
    return (node == nil ? @[] : [node getLevelOrder:node]);
}
