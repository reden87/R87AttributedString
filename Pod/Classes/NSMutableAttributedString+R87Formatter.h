//
//  NSMutableAttributedString+R87Formatter.h
//  Analyze Life
//
//  Created by Gergő Németh on 29/04/15.
//  Copyright (c) 2015 reden87. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (R87Formatter)

#pragma mark - Changing attributes

/** Same as setAttributes:range: in NSAttributedString class but this method sets the attribute between certain characters.
 
 The following example sets red text color to the \@"This is a *red* word." text:
 
 [attributexText r87_setAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} betweenCharacters:\@"*"];
 
 The result is: \@"This is a red word." where the red word's color is red.
 */
- (void)r87_setAttributes:(NSDictionary *)attributes betweenCharacters:(NSString *)characters;

/** Same as addAttribute:value:range: in NSAttributedString class but this method adds the attribute between certain characters.
 
 The following example adds red text color to the \@"This is a *red* word." text:
 
 [attributexText r87_addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] betweenCharacters:\@"*"];
 
 The result is: \@"This is a red word." where the red word's color is red.
 */
- (void)r87_addAttribute:(NSString *)name value:(id)value betweenCharacters:(NSString *)characters;

/** Same as addAttributes:range: in NSAttributedString class but this method adds the attribute between certain characters.
 
 The following example adds red text color to the \@"This is a *red* word." text:
 
 [attributexText r87_addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} betweenCharacters:\@"*"];
 
 The result is: \@"This is a red word." where the red word's color is red.
 */
- (void)r87_addAttributes:(NSDictionary *)attributes betweenCharacters:(NSString *)characters;

/** Same as removeAttribute:range: in NSAttributedString class but this method removes the attribute between certain characters.
 
 The following example removes red text color from the \@"This is a *red* word." text:
 
 [attributexText r87_removeAttribute:NSForegroundColorAttributeName betweenCharacters:\@"*"];
 
 The result is: \@"This is a red word." where the red word's color is not red any more.
 */
- (void)r87_removeAttribute:(NSString *)name betweenCharacters:(NSString *)characters;

/** Returns an array of NSValue object which contains NSRange structures. */
- (NSArray *)r87_findRangesWithCharaters:(NSString *)charactersToFind;

@end
