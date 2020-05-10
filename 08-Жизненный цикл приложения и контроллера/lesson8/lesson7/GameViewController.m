//
//  GameViewController.m
//  lesson7
//
//  Created by 18450686 on 08.05.2020.
//  Copyright © 2020 Ksenia Lukoshkina. All rights reserved.
//

#import "GameViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define HALF_SCREEN_WIDTH SCREEN_WIDTH/2
#define HALF_SCREEN_HEIGHT SCREEN_HEIGHT/2
#define MAX_SCORE 6

@interface GameViewController ()

@property (strong, nonatomic) UIImageView *paddleTop;
@property (strong, nonatomic) UIImageView *paddleBottom;
@property (strong, nonatomic) UIView *gridView;
@property (strong, nonatomic) UIImageView *ball;
@property (strong, nonatomic) UITouch *topTouch;
@property (strong, nonatomic) UITouch *bottomTouch;
@property (strong, nonatomic) NSTimer * timer;
@property (nonatomic) float dx;
@property (nonatomic) float dy;
@property (nonatomic) float speed;
@property (strong, nonatomic) UILabel *scoreTop;
@property (strong, nonatomic) UILabel *scoreBottom;


@end

@implementation GameViewController

- (void)initGrid {
    _gridView = [[UIView alloc] initWithFrame:CGRectMake(0, HALF_SCREEN_HEIGHT - 2, SCREEN_WIDTH, 4)];
    _gridView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:_gridView];
}

- (void)initPaddleTop {
    _paddleTop = [[UIImageView alloc] initWithFrame:CGRectMake(30, 40, 90, 60)];
    _paddleTop.image = [UIImage imageNamed:@"paddleTop2"];
    _paddleTop.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_paddleTop];
}

- (void)initPaddleBottom {
    _paddleBottom = [[UIImageView alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT - 90, 90, 60)];
    _paddleBottom.image = [UIImage imageNamed:@"paddleBottom2"];
    _paddleBottom.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_paddleBottom];
}

- (void)initBall {
    _ball = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x - 20, self.view.center.y - 20, 40, 40)];
    _ball.image = [UIImage imageNamed:@"ball"];
//    _ball.backgroundColor = [UIColor whiteColor];
    _ball.layer.cornerRadius = 30;
    _ball.hidden = YES;
    [self.view addSubview:_ball];
}

-(void)initScoreTop {
    _scoreTop = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT - 70, 50, 50)];
    _scoreTop.textColor = [UIColor whiteColor];
    _scoreTop.text = @"0";
    _scoreTop.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    _scoreTop.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_scoreTop];
}

-(void)initScoreBottom {
    _scoreBottom = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT + 70, 50, 50)];
   _scoreBottom.textColor = [UIColor whiteColor];
   _scoreBottom.text = @"0";
   _scoreBottom.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
   _scoreBottom.textAlignment = NSTextAlignmentCenter;
   [self.view addSubview:_scoreBottom];
}


- (void)config {
    self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    [self initGrid];
    [self initPaddleTop];
    [self initPaddleBottom];
    [self initBall];
    [self initScoreTop];
    [self initScoreBottom];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    // Do any additional setup after loading the view.
    
    NSLog(@"viewDidLoad - сразу после загрузки");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear - до отображения на экране");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear - после отображения на экране");
    [self becomeFirstResponder];
    [self newGame];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewDidAppear - до закрытия");
    [self resignFirstResponder];

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear - после закрытия");
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSLog(@"viewWillTransitionToSize - поворот");

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", event.allTouches);
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        NSLog(@"%f, %f", point.x, point.y);
        if (/*_bottomTouch == nil && */point.y > HALF_SCREEN_HEIGHT) {
            _bottomTouch = touch;
            _paddleBottom.center = CGPointMake(point.x, point.y);
        }
        else if (/*_topTouch == nil && */ point.y < HALF_SCREEN_HEIGHT) {
            _topTouch = touch;
            _paddleTop.center = CGPointMake(point.x, point.y);
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (touch == _topTouch) {
            if (point.y > HALF_SCREEN_HEIGHT) {
                _paddleTop.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
                return;
            }
            _paddleTop.center = point;
        }
        else if (touch == _bottomTouch) {
            if (point.y < HALF_SCREEN_HEIGHT) {
                _paddleBottom.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
                return;
            }
            _paddleBottom.center = point;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (touch == _topTouch) {
            _topTouch = nil;
        }
        else if (touch == _bottomTouch) {
            _bottomTouch = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self touchesEnded:touches withEvent:event];
}

- (void)displayMessage:(NSString *)message {
    [self stop];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ping Pong" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([self gameOver]) {
            [self newGame];
            return;
        }
        [self reset];
        [self start];
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)newGame {
    [self reset];
    
    _scoreTop.text = @"0";
    _scoreBottom.text = @"0";
        
        [self displayMessage:@"Готовы к игре?"];
    }

    - (int)gameOver {
        if ([_scoreTop.text intValue] >= MAX_SCORE) return 1;
        if ([_scoreBottom.text intValue] >= MAX_SCORE) return 2;
        return 0;
    }

    - (void)start {
        _ball.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
        if (!_timer) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(animate) userInfo:nil repeats:YES];
        }
        _ball.hidden = NO;
    }
- (void)reset {
    if ((arc4random() % 2) == 0) {
        _dx = -1;
    } else {
        _dx = 1;
    }
    
    if (_dy != 0) {
        _dy = -_dy;
    } else if ((arc4random() % 2) == 0) {
        _dy = -1;
    } else  {
        _dy = 1;
    }
    
    _ball.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    
    _speed = 2;
}

- (void)stop {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _ball.hidden = YES;
}

- (void)animate {
    _ball.center = CGPointMake(_ball.center.x + _dx*_speed, _ball.center.y + _dy*_speed);
    [self checkCollision:CGRectMake(0, 0, 20, SCREEN_HEIGHT) X:fabs(_dx) Y:0];
    [self checkCollision:CGRectMake(SCREEN_WIDTH, 0, 20, SCREEN_HEIGHT)

     X:-fabs(_dx) Y:0];
         if ([self checkCollision:_paddleTop.frame X:(_ball.center.x - _paddleTop.center.x) / 32.0 Y:1]) {
             [self increaseSpeed];
         }
         if ([self checkCollision:_paddleBottom.frame X:(_ball.center.x - _paddleBottom.center.x) / 32.0 Y:-1]) {
             [self increaseSpeed];
         }
         [self goal];
     }

     - (void)increaseSpeed {
         _speed += 0.5;
         if (_speed > 10) _speed = 10;
     }

  - (BOOL)checkCollision: (CGRect)rect X:(float)x Y:(float)y {
      if (CGRectIntersectsRect(_ball.frame, rect)) {
          if (x != 0) _dx = x;
          if (y != 0) _dy = y;
          return YES;
      }
      return NO;
  }

  - (BOOL)goal
  {
      if (_ball.center.y < 0 || _ball.center.y >= SCREEN_HEIGHT) {
          int s1 = [_scoreTop.text intValue];
          int s2 = [_scoreBottom.text intValue];
          
          if (_ball.center.y < 0) ++s2; else ++s1;
          _scoreTop.text = [NSString stringWithFormat:@"%u", s1];
          _scoreBottom.text = [NSString stringWithFormat:@"%u", s2];
          
          int gameOver = [self gameOver];
          if (gameOver) {
              [self displayMessage:[NSString stringWithFormat:@"Игрок %i выиграл", gameOver]];
          } else {
              [self reset];
          }
          
          return YES;
      }
      return NO;
  }


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
