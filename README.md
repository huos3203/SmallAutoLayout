#  实战autoLayout和autoSizeing masks
springs and struts 的问题  
毫无疑问你可能对autosizing masks比较熟悉–这个也就是 “springs and struts” 模式。autosizing mask决定了一个view会发生什么当它的superview   改变大小的时候。它是否有灵活并且自动修复页边处理能力（the struts），它的宽和高同时也会发生什么变化呢（the springs）？  
举个例子，当一个view的superview的宽度变宽时，它的宽度也会灵活地跟着变宽，并且它的右边界也会自动修复般的一直紧挨着superview的右边界。  
autosizing   系统处理这种简单的情况还是不错的，但是当情况稍微复杂一点的时候，它就会很快搞砸你的布局。现在让我们看一个springs and struts模式所不能处理的一个简单例子吧。  
打开Xcode创建一个基于Single View Application   template新项目，把之命名为”StrutsProblem”，选择iPhone程序并且禁用Storyboards：  

