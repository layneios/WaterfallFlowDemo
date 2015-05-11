#WaterfallFlowDemo
![最终效果图](http://i2.tietuku.com/524a67f4008263f5.gif)


> 瀑布流，又称瀑布流式布局。是比较流行的一种网站页面布局，视觉表现为参差不齐的多栏布局，随着页面滚动条向下滚动，这种布局还会不断加载数据块并附加至当前尾部。最早采用此布局的网站是Pinterest，逐渐在国内流行开来。国内大多数清新站基本为这类风格。

1. 可以不停地上啦刷新，数据无穷无尽
2. 每一列的宽度相同，列高不同，产生错落有致，聆郎满目的视觉效果

* 自定义流水布局
	* 新建自定义类，继承自`UICollectionViewFlowLayout`
	* 修改storyboard中`Collection View Flow Layout`自定义类为`LNWaterfallFlowLayout`
        * 默认情况下：`collectionView` 的`itemSize`是固定不变的
	* 瀑布流解题思路：如果提前计算出所有布局属性的`frame`，建立一个数组，在`-layoutAttributesForElementsInRect:`方法中直接返回，就能够达到瀑布流的效果

```objc
/**
 *  布局准备方法 初始化会被调用一次
 *  当collectionView的布局发生变化时 会被调用
 *  通常是做布局的准备工作 itemSize.....
 */
- (void)prepareLayout;
/**
 *  跟踪效果：当到达要显示的区域时 会计算所有显示item的属性
 *  一旦计算完成 所有的属性会被缓存 不会再次计算
 *  @return 返回布局属性(UICollectionViewLayoutAttributes)数组
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect;
```
