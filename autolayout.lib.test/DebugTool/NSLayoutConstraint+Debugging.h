//
// objc.io #3 sample code (http://www.objc.io/issue-3)
// Advanced Auto Layout Toolbox
//

///
/// This will add the call stack symbols to any NSLayoutConstraint that's added to a view.
///
/// This is disabled by default. In Debug builds, set the environment variable @c ObjcioLayoutConstraintsDebugging
///
/**
 Daniel 提出了另一个很巧妙的方法，可以为你提供更好的错误消息并且不需要额外的工作：
 对于每个布局约束条件，都需要将调用栈的标志融入到错误消息中。这样就很容易看出来问题涉及到的约束了。
 
 1. 运行时混淆方法：
 swizzle UIView 或者 NSView 的 addConstraint: / addConstraints: 方法，以及布局约束的 description 方法。
 2. 使用：在添加约束的方法中，为每个约束条件关联一个对象，这个对象描述了当前调用栈堆栈的第一个栈顶信息（或者任何你从中得到的信息）
 */
//#import <Foundation/Foundation.h>
@interface NSLayoutConstraint (ObjcioLayoutConstraintsDebugging)

@property (readonly, nonatomic, copy) NSArray *creationCallStackSymbols;

@end
