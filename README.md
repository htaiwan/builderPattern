# builder Pattern 建造者模式

****

## What is the pattern 

將一個複雜物件的構建與表示分離，使得同樣的構建過程可以建立不同的表示，此時就可以使用builder pattern，使用者只需要指定建造的類型就可以得到他們，而具體的建造過程跟細節就不需要知道。

## Why use the pattern 
1. 在建造者模式中，客戶端不必知道產品內部組成細節。
2. 工廠類模式：創建單個類的模式（關注單個產品）建造者模式：將各種產品集中起來進行管理（關注複合對象）

## How to use the pattern

抽象建造者(Builder)：為創建具體產品的具體建造者提供接口 - PizzaBuilder

```objective-c
@protocol PizzaBuilder <NSObject>

@required
- (void)setSize:(NSUInteger)size;
- (void)setMushrooms:(BOOL)mushrooms;
- (void)setPepperoni:(BOOL)pepperoni;

@end
```

產品角色(Product)：具體產品

具體建造者(ConcreteBuilder)：建造具體產品 - 透過block方式來取得用戶PizzaBuilder的設定

```objective-c
@interface Pizza : NSObject

@property (nonatomic, assign, readonly) NSUInteger size;
@property (nonatomic, assign, readonly) BOOL mushrooms;
@property (nonatomic, assign, readonly) BOOL pepperoni;

+ (instancetype)build:(void(^)(id<PizzaBuilder>builder))buildBlock;

@end

```

```objective-c
@implementation Pizza

+ (instancetype)build:(void(^)(id<PizzaBuilder>builder))buildBlock {
    Pizza* pizza = [Pizza new];
    if (buildBlock) buildBlock(pizza);
    
    NSLog(@" size: %@", @(pizza.size));
    NSLog(@" mushrooms: %@", @(pizza.mushrooms));
    NSLog(@" pepperoni: %@", @(pizza.pepperoni));
    
    // 取得用戶PizzaBuilder的設定，根據不同的設定在這裡進行客製化創建

    return pizza;
}

@end
```

用戶端使用

```objective-c
   Pizza *pizza = [Pizza build:^(id<PizzaBuilder> builder) {
        [builder setSize:12];
        [builder setMushrooms:YES];
        [builder setPepperoni:NO];
    }];
    
```
