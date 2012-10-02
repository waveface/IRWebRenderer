//
//  IRWebRenderer.h
//  IRWebRenderer
//
//  Created by Evadne Wu on 6/15/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRWebRendererDefines.h"

@interface IRWebRenderer : NSObject

@property (nonatomic, strong) UIImage *image;

- (void) renderWithConfiguration:(IRWebRendererConfigurationBlock)configurationBlock;

@end
