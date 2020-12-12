//
//  PhotoCell.m
//  NasaPOD
//
//  Created by Cora Jacobson on 12/11/20.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    _imageView.image = [UIImage imageNamed:@"planet"];
    _dateLabel.text = @"Date";
}

@end
