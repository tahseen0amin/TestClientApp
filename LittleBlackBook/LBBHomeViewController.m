//
//  LBBHomeViewController.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 26/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "LBBHomeViewController.h"
#import "Media.h"
#import "PhotoView.h"
#import <Haneke/Haneke.h>

@interface LBBHomeViewController() <DraggableCardViewDelegate>

@property(nonatomic, strong) NSArray *mediaArray; //array of media
@property(nonatomic, strong) IBOutlet UIView *photoPlaceHolder;

@property (nonatomic, strong) NSMutableArray *photoViews; // of PhotoView

@end

@implementation LBBHomeViewController


- (void)viewDidLoad {
    self.photoViews = [NSMutableArray new];
    [[LBBEngine sharedEngine] getRecentPhotosFromFlikr];
    [self fetchData:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchData:) name:@"PhotoSaved" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PhotoSaved" object:nil];
}
- (void)fetchData:(NSNotification *)notification {
    self.mediaArray =[[LBBEngine sharedEngine] fetchPhotosToShowInHome];
    [self initCardViews];
}

- (IBAction)loadMore:(id)sender {
    self.photoViews = [NSMutableArray new];
    [self fetchData:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self layoutCardViews];
}

- (void)initCardViews
{
    for (NSUInteger i = 0; i < self.mediaArray.count; i++)
    {
        PhotoView *photoView = [[[NSBundle mainBundle] loadNibNamed:@"PhotoView" owner:self options:nil] firstObject];
        photoView.frame = self.photoPlaceHolder.frame;
        photoView.delegateOfDragging = self;
        photoView.rightOverlayImage = [UIImage imageNamed:@"no"];
        photoView.leftOverlayImage = [UIImage imageNamed:@"yes"];
        photoView.media = self.mediaArray[i];
        [self.photoViews addObject:photoView];
    }
    
    for (PhotoView *photoView  in self.photoViews.reverseObjectEnumerator)
    {
        [self.view addSubview:photoView];
    }
}

- (void)layoutCardViews
{
    for (PhotoView *i in self.photoViews)
    {
        i.frame = self.photoPlaceHolder.frame;
    }
}

#pragma PHOTO CARD DELEGATE
- (void)cardView:(DraggableCardView *)cardView didEndSwipeToDirection:(SwipeDirection)swipeDirection {
    switch (swipeDirection) {
        case RightSwipeDirection: {
            [self photoCardSwipedRight:cardView];
        }
            break;
        case LeftSwipeDirection: {
            [self photoCardSwipedLeft:cardView];
        }
            break;
        default:
            break;
    }
}

- (NSArray *)shouldBlockSwipeDirections {
    return @[@(UpSwipeDirection),@(DownSwipeDirection)];
}

- (void)photoCardSwipedRight:(DraggableCardView *)cardView {
    PhotoView *photoView = (PhotoView *) cardView;
    [[LBBEngine sharedEngine] changedStatusOfMedia:photoView.media image:photoView.imageView.image ToStatus:MediaSelectedStateLIKED];
}

- (void)photoCardSwipedLeft:(DraggableCardView *)cardView {
    PhotoView *photoView = (PhotoView *) cardView;
    [[LBBEngine sharedEngine] changedStatusOfMedia:photoView.media image:photoView.imageView.image ToStatus:MediaSelectedStateDISLIKED];
}

- (void)didReceiveMemoryWarning {
    for (UIView *v in self.photoViews) {
        [v removeFromSuperview];
    }
}

@end
