//
//  AKPanner.m
//  AudioKit
//
//  Auto-generated from scripts by Aurelius Prochazka on 12/21/14.
//  Copyright (c) 2014 Hear For Yourself. All rights reserved.
//
//  Implementation of Csound's pan2:
//  http://www.csounds.com/manual/html/pan2.html
//

#import "AKPanner.h"
#import "AKManager.h"

@implementation AKPanner
{
    AKAudio *_audioSource;
}

- (instancetype)initWithAudioSource:(AKAudio *)audioSource
                                pan:(AKParameter *)pan
                          panMethod:(AKConstant *)panMethod
{
    self = [super initWithString:[self operationName]];
    if (self) {
        _audioSource = audioSource;
        _pan = pan;
        _panMethod = panMethod;
    }
    return self;
}

- (instancetype)initWithAudioSource:(AKAudio *)audioSource
{
    self = [super initWithString:[self operationName]];
    if (self) {
        _audioSource = audioSource;
        // Default Values
        _pan = akp(0);    
        _panMethod = akp(0);    
    }
    return self;
}

+ (instancetype)stereoaudioWithAudioSource:(AKAudio *)audioSource
{
    return [[AKPanner alloc] initWithAudioSource:audioSource];
}

- (void)setOptionalPan:(AKParameter *)pan {
    _pan = pan;
}
- (void)setOptionalPanMethod:(AKConstant *)panMethod {
    _panMethod = panMethod;
}

- (NSString *)stringForCSD {
    return [NSString stringWithFormat:
            @"%@ pan2 %@, 0.5 * (%@+1), %@",
            self,
            _audioSource,
            _pan,
            _panMethod];
}

@end
