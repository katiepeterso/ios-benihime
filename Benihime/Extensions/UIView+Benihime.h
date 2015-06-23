//
//  UIView+Benihime.h
//  Benihime
//
//  Created by Shiki on 12/7/11.
//

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface UIView (Benihime)

// From: http://stackoverflow.com/q/1823317/246142
- (UIView *)findFirstResponder;
// From: http://stackoverflow.com/q/1823317/246142
- (UIView *)findAndResignFirstResponder;

- (void)setTapResignsFirstResponder;

- (UIView *)ancestorWithClass:(Class)ancestorClass;
+ (UIView *)ancestorOfView:(UIView *)child withClass:(Class)ancestorClass;

// Returns the first descendant view that is an instance of the given class.
- (UIView *)descendantWithClass:(Class)descendantClass;
+ (UIView *)descendantOfView:(UIView *)parent withClass:(Class)descendantClass;

- (UIView *)childWithClass:(Class)childClass;
+ (UIView *)childOfView:(UIView *)parent withClass:(Class)childClass;

// From: http://stackoverflow.com/a/3732812
- (UIViewController *)firstAvailableViewController;

@end
