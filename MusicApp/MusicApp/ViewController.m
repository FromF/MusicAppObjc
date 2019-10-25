//
//  ViewController.m
//  MusicApp
//
//  Created by 藤治仁 on 2019/10/26.
//  Copyright © 2019 FromF.github.com. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic,strong) AVAudioPlayer *cymbalPlayer;
@property (nonatomic,strong) AVAudioPlayer *guitarPlayer;
@property (nonatomic,strong) AVAudioPlayer *backmusicPlayer;
@property (nonatomic,strong) NSString *cymbalPath;
@property (nonatomic,strong) NSString *guitarPath;
@property (nonatomic,strong) NSString *backmusicPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // バンドルを取得する
    NSBundle *bundle = [NSBundle mainBundle];
    // シンバルの音源ファイルを指定
    self.cymbalPath = [bundle pathForResource:@"cymbal" ofType:@"mp3"];
    // ギターの音源ファイルを指定
    self.guitarPath = [bundle pathForResource:@"guitar" ofType:@"mp3"];
    // バックミュージックの音源ファイルを指定
    self.backmusicPath = [bundle pathForResource:@"backmusic" ofType:@"mp3"];
}

#pragma mark - Button
- (IBAction)cymbal:(id)sender {
    NSError *error;
    // ファイルパスをNSURL形式に変換
    NSURL *playFileURL = [NSURL fileURLWithPath:self.cymbalPath];
    // シンバル用のプレイヤーに、音源ファイル名を指定
    self.cymbalPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:playFileURL error:&error];
    //シンバルの音源再生
    [self.cymbalPlayer play];
}

- (IBAction)guitar:(id)sender {
    NSError *error;
    // ファイルパスをNSURL形式に変換
    NSURL *playFileURL = [NSURL fileURLWithPath:self.guitarPath];
    // ギター用のプレイヤーに、音源ファイル名を指定
    self.guitarPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:playFileURL error:&error];
    //ギターの音源再生
    [self.guitarPlayer play];
}

- (IBAction)play:(id)sender {
    NSError *error;
    // ファイルパスをNSURL形式に変換
    NSURL *playFileURL = [NSURL fileURLWithPath:self.backmusicPath];
    // バックミュージック用のプレイヤーに、音源ファイル名を指定
    self.backmusicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:playFileURL error:&error];
    // リピート設定
    self.backmusicPlayer.numberOfLoops = -1;
    //バックミュージックの音源再生
    [self.backmusicPlayer play];
}

- (IBAction)stop:(id)sender {
    // バックミュージック停止
    [self.backmusicPlayer stop];
}
@end
