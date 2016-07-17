//
//  ViewController.m
//  AVStoryBook
//
//  Created by Viviane Chan on 2016-07-15.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "ViewController.h"

@import MediaPlayer;
@import Photos;
@import AVFoundation;
@import AVKit;



@interface ViewController () <AVAudioPlayerDelegate, AVAudioRecorderDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.session = [AVAudioSession sharedInstance];
    [self setupSoundFileURL];
    [self setupRecorder];
    self.imageView.image = self.photo.photo;

}

#pragma Set Up - Audio

- (void)setupSoundFileURL {
    NSArray *pathComponents = @[ [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject], @"sound.m4a"];
    self.soundFileURL = [NSURL fileURLWithPathComponents:pathComponents];
}

- (void)setupRecorder {
    
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    settings[AVFormatIDKey] = @(kAudioFormatMPEG4AAC);
    settings[AVSampleRateKey] = @(44100.0);
    settings[AVNumberOfChannelsKey] = @(2);
    // prepare for recording
    NSError *error = nil;
    self.recorder = [[AVAudioRecorder alloc] initWithURL:self.soundFileURL settings:settings error:&error];
    self.recorder.delegate = self;
    self.recorder.meteringEnabled = YES;
    [self.recorder prepareToRecord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button Actions


- (IBAction)takeAPicture:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


- (IBAction)RecordAudio:(id)sender {

    if (self.player.playing) {
        [self.player stop];
    }
    if (!self.recorder.recording) {
        NSError *error = nil;
        [self.session setActive:YES error:&error];
        [self.session setCategory:AVAudioSessionCategoryRecord error:nil];
        NSAssert(error == nil, @"%@", error.localizedDescription);
        [self.recorder record];
        
        // disable play button
        self.playButton.enabled = NO;
        
        // show stop, hide record
        
        self.stopButton.hidden = NO;
        self.recordButton.hidden = YES;
        
    } else {
        
        [self.recorder stop];
        
        // swap buttons
        self.stopButton.hidden = YES;
        self.recordButton.hidden = NO;
        self.playButton.enabled = YES;
    }
}


- (IBAction)playAudio:(id)sender {
    if (self.recorder.isRecording) {
        return;
    }
    if (self.player.isPlaying) {
        [self.player stop];
        return;
    }
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recorder.url error:nil];
    [self.session setCategory:AVAudioSessionCategoryPlayback error:nil];
    self.player.delegate = self;
    [self.player play];
    self.recordButton.enabled = NO;
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


#pragma mark - Delegate Methods

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    self.recordButton.enabled = YES;
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    // show record again, and hide stop
    self.recordButton.hidden = NO;
    self.stopButton.hidden = YES;
}




@end
