//
//  Pizza.m
//  BuilderPattern
//
//  Created by Chien-Tai Cheng on 10/24/16.
//  Copyright © 2016 Chien-Tai Cheng. All rights reserved.
//

#import "Pizza.h"

// in Pizza.m
@interface Pizza () <PizzaBuilder>

@property (nonatomic, assign) NSUInteger size;
@property (nonatomic, assign) BOOL mushrooms;
@property (nonatomic, assign) BOOL pepperoni;

@end

@implementation Pizza

+ (instancetype)build:(void(^)(id<PizzaBuilder>builder))buildBlock {
    Pizza* pizza = [Pizza new];
    if (buildBlock) buildBlock(pizza);
    
    NSLog(@" size: %@", @(pizza.size));
    NSLog(@" mushrooms: %@", @(pizza.mushrooms));
    NSLog(@" pepperoni: %@", @(pizza.pepperoni));

    return pizza;
}

@end
