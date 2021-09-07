//
//  Test.m
//  Array
//
//  Created by Раисат Рамазанова on 30.08.2021.
//

#import <Foundation/Foundation.h>

@interface SampleClass:NSObject
/* method declaration */

- (NSArray *) sortedArray: (NSArray)arrayOld;


@end

@implementation SampleClass

- (NSArray *)toArray:(int *)maze {
   NSMutableArray *retVal = [[NSMutableArray alloc] init];
   for (int c = 0; maze[c] != NULL; c++) {
      [retVal addObject:[NSNumber numberWithInt:maze[c]]];
   }
   return [retVal array];
}


- (NSArray *) sortedArray: (NSArray*)arrayOld {
   
    NSArray *sortedArray = [arrName sortedArrayUsingComparator:^(Cars *firstObject, Cars *secondObject) {
        return [firstObject.str_name compare:secondObject.str_name];
    }];
    arrName =[NSMutableArray arrayWithArray:sortedArray];
    
   /* local variable declaration */
   int result;
 
   if (num1 > num2) {
      result = num1;
   } else {
      result = num2;
   }
    return arrName;
 }

@end

int main () {
   
   /* local variable definition */
   int a = 100;
   int b = 200;
   int ret;
   
   SampleClass *sampleClass = [[SampleClass alloc]init];

   /* calling a method to get max value */
   ret = [sampleClass max:a andNum2:b];
 
   NSLog(@"Max value is : %d\n", ret );
   return 0;
}
