@import UIKit;

@interface WPMediaCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) NSInteger position;

- (void)setCaption:(NSString *)caption;

@end
