//
//  ViewController.h
//  AVStoryBook
//
//  Created by Viviane Chan on 2016-07-15.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photos.h"
@import AVKit;
@import Photos;
@import AVFoundation;

@interface ViewController : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>

// Audio
@property (nonatomic)AVAudioPlayer *player;
@property (nonatomic) AVAudioRecorder *recorder;
@property (nonatomic) NSURL *soundFileURL;
@property (nonatomic) AVAudioSession *session;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;

// Photos
@property (nonatomic) Photos *photo;
@property NSInteger index;

@end


