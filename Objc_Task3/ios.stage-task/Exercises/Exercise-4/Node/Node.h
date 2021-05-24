#ifndef Node_h
#define Node_h

@interface Node : NSObject

@property(nonatomic) NSNumber *num;
@property(nonatomic) Node *left;
@property(nonatomic) Node *right;

-(instancetype)initWithValue:(NSNumber *) value;
+ (Node *) createTree:(NSArray *)binaryTreeRawData;
//- (NSArray *) dataFromBinaryTree:(Node *)root;
- (NSArray*) getCurrentLevel:(Node*) root level:(int) level;
- (NSArray*) getLevelOrder:(Node*) root;
- (int) height:(Node*) root;

@end
#endif /* Node_h */
