//
//  Pizza.h
//  BuilderPattern
//
//  Created by Chien-Tai Cheng on 10/24/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PizzaBuilder <NSObject>

@required
- (void)setSize:(NSUInteger)size;
- (void)setMushrooms:(BOOL)mushrooms;
- (void)setPepperoni:(BOOL)pepperoni;

@end

@interface Pizza : NSObject

@property (nonatomic, assign, readonly) NSUInteger size;
@property (nonatomic, assign, readonly) BOOL mushrooms;
@property (nonatomic, assign, readonly) BOOL pepperoni;

+ (instancetype)build:(void(^)(id<PizzaBuilder>builder))buildBlock;

@end
