//
//  PhotoCell.h
//  NasaPOD
//
//  Created by Cora Jacobson on 12/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCell : UICollectionViewCell

@property (nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic) IBOutlet UIImageView *imageView;

@end

NS_ASSUME_NONNULL_END
