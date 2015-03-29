//
//  ViewController.h
//  InstaKilo
//
//  Created by Shahin on 2015-03-26.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "PhotoCollectionViewCell.h"

@interface ViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) Photo *photo;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

