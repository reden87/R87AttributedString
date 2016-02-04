//
//  NSMutableAttributedString+R87Formatter.m
//  Analyze Life
//
//  Created by Gergő Németh on 29/04/15.
//  Copyright (c) 2015 reden87. All rights reserved.
//

#import "NSMutableAttributedString+R87Formatter.h"

@implementation NSMutableAttributedString (R87Formatter)

#pragma mark - Changing attributes

- (void)r87_setAttributes:(NSDictionary *)attributes betweenCharacters:(NSString *)characters {
	NSArray *ranges = [self r87_findRangesWithCharaters:characters];
	
	[ranges enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
		if ([obj isKindOfClass:[NSValue class]]) {
			NSValue *thisValue = (NSValue *)obj;
			NSRange range = thisValue.rangeValue;
			
			[self setAttributes:attributes range:range];
		}
	}];
}

- (void)r87_addAttribute:(NSString *)name value:(id)value betweenCharacters:(NSString *)characters {
	NSArray *ranges = [self r87_findRangesWithCharaters:characters];
	
	[ranges enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
		if ([obj isKindOfClass:[NSValue class]]) {
			NSValue *thisValue = (NSValue *)obj;
			NSRange range = thisValue.rangeValue;
			
			[self addAttribute:name value:value range:range];
		}
	}];
}

- (void)r87_addAttributes:(NSDictionary *)attributes betweenCharacters:(NSString *)characters {
	NSArray *ranges = [self r87_findRangesWithCharaters:characters];
	
	[ranges enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
		if ([obj isKindOfClass:[NSValue class]]) {
			NSValue *thisValue = (NSValue *)obj;
			NSRange range = thisValue.rangeValue;
			
			[self addAttributes:attributes range:range];
		}
	}];
}

- (void)r87_removeAttribute:(NSString *)name betweenCharacters:(NSString *)characters {
	NSArray *ranges = [self r87_findRangesWithCharaters:characters];
	
	[ranges enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
		if ([obj isKindOfClass:[NSValue class]]) {
			NSValue *thisValue = (NSValue *)obj;
			NSRange range = thisValue.rangeValue;
			
			[self removeAttribute:name range:range];
		}
	}];
}

- (NSArray *)r87_findRangesWithCharaters:(NSString *)charactersToFind {
	NSMutableArray *resultArray = [[NSMutableArray alloc] init];
	
	BOOL insideTheRange = NO;
	NSUInteger startingRangeLocation = 0;
	while ([self.mutableString rangeOfString:charactersToFind].location != NSNotFound) {
		NSRange charactersLocation = [self.mutableString rangeOfString:charactersToFind];
		
		if (!insideTheRange) {
			startingRangeLocation = charactersLocation.location;
			insideTheRange = YES;
			
			// remove characters
			[self.mutableString deleteCharactersInRange:charactersLocation];
		}
		else {
			NSRange range = NSMakeRange(startingRangeLocation, charactersLocation.location - startingRangeLocation);
			insideTheRange = NO;
			
			[resultArray addObject:[NSValue valueWithRange:range]];
			
			// remove characters
			[self.mutableString deleteCharactersInRange:charactersLocation];
		}
	}
	
	return [resultArray copy];
}

@end
