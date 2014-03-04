//
//  NSArray+Benihime.m
//  Benihime
//
//  Created by Shiki on 11/29/11.
//

#import "NSArray+Benihime.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NSArray (Benihime)

- (id)findUsingBlock:(BOOL (^)(id obj))block {
  for (id object in self) {
    BOOL result = block(object);
    if (result)
      return object;
  }
  
  return nil;
}

- (NSUInteger)findIndexUsingBlock:(BOOL (^)(id obj))block {
  __block NSInteger index = NSNotFound;
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    if (block(obj)) {
      *stop = YES;
      index = idx;
    }
  }];
  
  return index;
}

- (NSMutableArray *)mapUsingBlock:(id (^)(id obj))block {
  NSMutableArray *ret = [NSMutableArray array];
  for (id object in self) {
    id result = block(object);
    [ret addObject:result];
  }
  
  return ret;
}

- (NSMutableArray *)filterUsingBlock:(BOOL (^)(id obj))block {
  NSMutableArray *ret = [NSMutableArray array];
  for (id object in self) {
    if (block(object))
      [ret addObject:object];
  }
  
  return ret;
}

- (NSString *)jsonString:(NSJSONWritingOptions)opt {
  NSError *error = nil;
  NSData *data = [NSJSONSerialization dataWithJSONObject:self options:opt error:&error];
  if (data) {
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return ret;
  } else {
    return nil;
  }
}

- (NSString *)jsonString {
  return [self jsonString:0];
}

- (NSArray *)reversedArray {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  NSEnumerator *enumerator = [self reverseObjectEnumerator];
  for (id element in enumerator) {
    [array addObject:element];
  }
  return array;
}

@end
