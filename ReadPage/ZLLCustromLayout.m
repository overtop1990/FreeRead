//
//  ZLLCustromLayout.m
//  fangxie
//
//  Created by 朱乐乐 on 16/7/2.
//  Copyright © 2016年 朱乐乐. All rights reserved.
//

#import "ZLLCustromLayout.h"

@interface ZLLCustromLayout ()
/** //移动一个item所需contentoffset  */
@property (nonatomic) CGFloat dragOffset;
/** 存放每个item的attr  */
@property (nonatomic) NSMutableArray *layoutAttrArr;
/** 顶部Cell的index  */
@property (nonatomic) NSInteger featureItemIndex;
/** 返回一个比率(0~1) 设置即将放大cell的高  */
@property (nonatomic) CGFloat nextItemPercentageOffset;
/** Cell宽度  */
@property (nonatomic) CGFloat width;
/** Cell高度  */
@property (nonatomic) CGFloat height;
/** <# #>  */
@property (nonatomic) NSInteger numberOfItems;
@end

@implementation ZLLCustromLayout

- (CGFloat)dragOffset{
    return _featureCellHeight - _standardCellHeight;
}

- (NSMutableArray *)layoutAttrArr{
    if (!_layoutAttrArr) {
        _layoutAttrArr = [NSMutableArray array];
    }
    return _layoutAttrArr;
}
- (NSInteger)featureItemIndex{
    //当前显示区域的顶点相对于frame顶点的偏移量 contentOffset
    return MAX(0, (self.collectionView.contentOffset.y / self.dragOffset));
}
//返回一个比率(0~1) 设置即将放大cell的高
-(CGFloat)nextItemPercentageOffset{
    
    return (self.collectionView.contentOffset.y / self.dragOffset) - self.featureItemIndex;
}
- (CGFloat)width{
    return CGRectGetWidth(self.collectionView.bounds);
}
- (CGFloat)height{
    return CGRectGetHeight(self.collectionView.bounds);
}
- (NSInteger)numberOfItems{
    return [self.collectionView numberOfItemsInSection:0];
}

//自定义的FlowLayout必须一次执行下面三个方法
//1.准备所有view的layoutAttribute信息
-(void)prepareLayout{
    [self.layoutAttrArr removeAllObjects];
    
    CGRect frame = CGRectZero;
    CGFloat y = 0;
    for (NSInteger item = 0; item < [self.collectionView numberOfItemsInSection:0]; item ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.zIndex = item;
        //初始化所有item的高度为standardCellHeight
        CGFloat height = self.standardCellHeight;
        if (indexPath.item == self.featureItemIndex) {
            CGFloat yOffset = self.standardCellHeight * self.nextItemPercentageOffset;
            y = self.collectionView.contentOffset.y - yOffset;
            height = self.featureCellHeight;
        }else if (indexPath.item == (self.featureItemIndex + 1) && indexPath.item != self.numberOfItems){
            CGFloat maxY = y + self.standardCellHeight;
            height = self.standardCellHeight + MAX((self.featureCellHeight - self.standardCellHeight) * self.nextItemPercentageOffset, 0);
            y = maxY - height;
        }
        frame = CGRectMake(0, y, self.width, height);
        attributes.frame = frame;
        [self.layoutAttrArr addObject: attributes];
        y = CGRectGetMaxY(frame);
        
    }
}
//计算contentsize
- (CGSize)collectionViewContentSize{
    //contentSize 为collectionView的高度 + 每个item放大需要拖拽的偏移量 - 移动一个item的偏移量（因为第一个已经是放大的了）
    CGFloat contentHeight = self.height + self.numberOfItems * self.dragOffset - self.dragOffset;
    return CGSizeMake(self.width, contentHeight);
}
//返回在可见区域的view的layoutAttribute信息
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attr in self.layoutAttrArr) {
        if (CGRectIntersectsRect(attr.frame, rect)) {
            [layoutAttributes addObject:attr];
        }
    }
    return layoutAttributes;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
//计算那里的滚动视图应该停止
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    NSInteger itemIndex = round(proposedContentOffset.y / self.dragOffset);
    return CGPointMake(0, itemIndex * self.dragOffset)
    ;}

@end
