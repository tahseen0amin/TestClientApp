//
//  LBBLikedPhotoViewController.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "LBBLikedPhotoViewController.h"
#import "LBBPhotoCell.h"
#import "Media.h"
@interface LBBLikedPhotoViewController()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LBBLikedPhotoViewController

-(void)viewDidLoad {
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [self getData];
}

- (void)getData {
    self.dataArray = [[LBBEngine sharedEngine] fetchLikedPhotosFromCoreData];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LBBPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    Media *media = self.dataArray[indexPath.item];
    if (media.image) {
        cell.lbb_ImageViewPhoto.image = [UIImage imageWithData:media.image];
    } else {
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            //Background Thread
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:media.mediaURL]] scale:1.0];
            dispatch_async(dispatch_get_main_queue(), ^(void){
                //Run UI Updates
                if (image) {
                    cell.lbb_ImageViewPhoto.image = image;
                }
            });
        });
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat length = collectionView.bounds.size.width/2;
    return CGSizeMake(length, length);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

@end
