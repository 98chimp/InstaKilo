//
//  ViewController.m
//  InstaKilo
//
//  Created by Shahin on 2015-03-26.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *allPhotos;
@property (nonatomic, strong) NSArray *photosBySubject;
@property (nonatomic, strong) NSArray *photosByLocation;
@property (nonatomic, strong) UICollectionViewFlowLayout *smallLayout;
@property (nonatomic, strong) UICollectionViewFlowLayout *bigLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UICollectionViewFlowLayout *bigLayout = [[UICollectionViewFlowLayout alloc] init];
    bigLayout.itemSize = CGSizeMake(140, 140);
    bigLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    bigLayout.minimumInteritemSpacing = 10.0f;
    bigLayout.minimumLineSpacing = 10.0f;
    bigLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 100.f);
    
    UICollectionViewFlowLayout *smallLayout = [[UICollectionViewFlowLayout alloc] init];
    smallLayout.itemSize = CGSizeMake(40, 40);
    smallLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    smallLayout.minimumInteritemSpacing = 10.0f;
    smallLayout.minimumLineSpacing = 10.0f;
    smallLayout.headerReferenceSize = CGSizeZero;
    
//    [self.collectionView setCollectionViewLayout:bigLayout];
    
    Photo *photo01 = [[Photo alloc] initWithTitle:@"IMG01.JPG"
                                          subject:@"Artsy"
                                         location:@"Inside"];
    
    Photo *photo02 = [[Photo alloc] initWithTitle:@"IMG02.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo03 = [[Photo alloc] initWithTitle:@"IMG03.JPG"
                                          subject:@"Artsy"
                                         location:@"Outside"];
    
    Photo *photo04 = [[Photo alloc] initWithTitle:@"IMG04.JPG"
                                          subject:@"Objects"
                                         location:@"Computer"];
    
    Photo *photo05 = [[Photo alloc] initWithTitle:@"IMG05.JPG"
                                          subject:@"Nature"
                                         location:@"Indide"];
    
    Photo *photo06 = [[Photo alloc] initWithTitle:@"IMG06.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo07 = [[Photo alloc] initWithTitle:@"IMG07.JPG"
                                          subject:@"Nature"
                                         location:@"Computer"];
    
    Photo *photo08 = [[Photo alloc] initWithTitle:@"IMG08.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo09 = [[Photo alloc] initWithTitle:@"IMG09.JPG"
                                          subject:@"Objects"
                                         location:@"Inside"];
    
    Photo *photo10 = [[Photo alloc] initWithTitle:@"IMG10.JPG"
                                          subject:@"Nature"
                                         location:@"Outside"];
    
    self.allPhotos = @[photo01, photo02, photo03, photo04, photo05, photo06, photo07, photo08, photo09, photo10];
    
    NSArray *artsyPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Artsy"]];
    NSArray *objectPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Objects"]];
    NSArray *naturePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Nature"]];
    
    self.photosBySubject = @[artsyPhotos, objectPhotos, naturePhotos];
    
    NSArray *computerPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Computer"]];
    NSArray *insidePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Inside"]];
    NSArray *outsidePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Outside"]];
    
    self.photosByLocation = @[computerPhotos, insidePhotos, outsidePhotos];
}


-(NSPredicate *)predicateWithSubject:(NSString *)subject {
    return [NSPredicate predicateWithFormat:@"SELF.subject contains[c] '%@'", subject];
}

-(NSPredicate *)predicateWithLocation:(NSString *)location {
    return [NSPredicate predicateWithFormat:@"SELF.subject contains[c] '%@'", location];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.allPhotos.count;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Photo" forIndexPath:indexPath];
    
    Photo *photo = [self.allPhotos objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.photoCellImageView.image = [UIImage imageNamed:photo.title];


    return cell;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *caption = [NSString stringWithFormat:@"Title: %@\nSubject: %@\nLocation: %@", self.photo.title, self.photo.subject, self.photo.location];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"caption" message:caption delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    
    [alertView show];
}

@end
