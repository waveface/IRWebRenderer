//
//  IRWebRenderer.m
//  IRWebRenderer
//
//  Created by Evadne Wu on 6/15/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRWebRenderer.h"
#import "IRWebRenditionOperation.h"

@interface IRWebRenderer () <UIWebViewDelegate>
@property (nonatomic, readwrite, strong) NSOperationQueue *operationQueue;
@end

@implementation IRWebRenderer
@synthesize operationQueue = _operationQueue;

+ (NSOperationQueue *)operationQueue {
  static NSOperationQueue *opQueue = nil;
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    opQueue = [[NSOperationQueue alloc] init];
    opQueue.maxConcurrentOperationCount = 1;
  });
  
  return opQueue;
}

- (id) init {

	self = [super init];
	if (!self)
		return nil;
		
	return self;

}

- (void) renderWithConfiguration:(IRWebRendererConfigurationBlock)configurationBlock {

	IRWebRenditionOperation *operation = [[IRWebRenditionOperation alloc] initWithConfigurationBlock:^(UIWebView *webView) {

		configurationBlock(webView);
		
	}];
	
	__weak IRWebRenditionOperation *wOperation = operation;
	
	[operation setCompletionBlock:^{
	
    self.image = wOperation.image;
//		completionBlock(wOperation.image);
		
	}];

  [[[self class] operationQueue] addOperation:operation];
	
}

@end
