#import "IntroModel.h"

@implementation IntroModel

@synthesize titleText;
@synthesize descriptionText;
@synthesize imageUrl;

- (id) initWithTitle:(NSString*)title description:(NSString*)desc image:(NSString*)imageText {
    self = [super init];
    if(self != nil) {
        titleText = title;
        descriptionText = desc;
        imageUrl = imageText;
    }
    return self;
}

@end
