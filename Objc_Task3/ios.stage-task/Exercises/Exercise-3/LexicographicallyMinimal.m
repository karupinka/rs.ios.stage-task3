#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *string1Tmp = [NSMutableString stringWithString:string1];
    NSMutableString *string2Tmp = [NSMutableString stringWithString:string2];
    NSMutableString *resultString = [NSMutableString stringWithString:@""];
    int string2Count = 0;
    
    for (int i = 0; i < [string1Tmp length]; i++) {
        for (int j = 0; j < [string2Tmp length]; j++) {
            if (i < [string1Tmp length]) {
                if ([string1Tmp characterAtIndex:i] <= [string2Tmp characterAtIndex:j]) {
                    char c = [string1Tmp characterAtIndex:i];
                    NSString *s = [NSString stringWithFormat:@"%c", c];
                    [resultString appendString: s];
                    i += 1;
                    j -= 1;
                    
                } else {
                    char c = [string2Tmp characterAtIndex:j];
                    [resultString appendFormat:@"%c", c];
                    string2Count++;
                }
            }
            if ([string2Tmp length] <= string2Count) {
                string2Tmp = [NSMutableString stringWithString:@""];
            }
            
        }
        if ([string2Tmp length] <= string2Count) {
            [resultString appendFormat:@"%c", [string1Tmp characterAtIndex:i]];
        }
    }
    if ([string2Tmp length] > string2Count) {
        [resultString appendString:[string2Tmp substringFromIndex:string2Count]];
    }

    return resultString;
}

@end
