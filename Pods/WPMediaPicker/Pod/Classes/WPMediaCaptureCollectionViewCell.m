#import "WPMediaCaptureCollectionViewCell.h"
#import "WPMediaPickerResources.h"
@import AVFoundation;

@interface WPMediaCaptureCollectionViewCell ()

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) dispatch_queue_t sessionQueue;
@property (nonatomic, strong) UIView *previewView;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;

@end

@implementation WPMediaCaptureCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];

    self.backgroundColor = [UIColor blackColor];
    _sessionQueue = dispatch_queue_create("org.wordpress.WPMediaCaptureCollectionViewCell", DISPATCH_QUEUE_SERIAL);
    _previewView = [[UIView alloc] initWithFrame:self.bounds];
    _previewView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.contentView addSubview:_previewView];

    UIImage *cameraImage = [WPMediaPickerResources imageNamed:@"camera" withExtension:@"png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:cameraImage];
    imageView.center = self.contentView.center;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:imageView];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)stopCaptureOnCompletion:(void (^)(void))block
{
    if (!self.session) {
        dispatch_async(dispatch_get_main_queue(), block);
        return;
    }
    self.captureVideoPreviewLayer.connection.enabled = NO;
    dispatch_async(self.sessionQueue, ^{
        if ([self.session isRunning]){
            [self.session stopRunning];
        }
        dispatch_async(dispatch_get_main_queue(), block);
    });
}

- (void)startCapture
{
    if ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo] != AVAuthorizationStatusAuthorized &&
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo] != AVAuthorizationStatusNotDetermined)
    {
        return;
    }
    dispatch_async(self.sessionQueue, ^{
        if (!self.session){
            self.session = [[AVCaptureSession alloc] init];
            self.session.sessionPreset = AVCaptureSessionPresetLow;
            
            AVCaptureDevice *device =
            [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
            
            NSError *error = nil;
            AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
            [self.session addInput:input];
        }
        if (!self.session.isRunning){
            [self.session startRunning];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.captureVideoPreviewLayer removeFromSuperlayer];
                CALayer *viewLayer = self.previewView.layer;
                self.captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
                self.captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
                self.captureVideoPreviewLayer.frame = viewLayer.bounds;
                [viewLayer addSublayer:_captureVideoPreviewLayer];
            });
        }
    });
}

- (void)deviceOrientationDidChange:(NSNotification *)notification
{
    if (self.captureVideoPreviewLayer.connection.supportsVideoOrientation) {
        self.captureVideoPreviewLayer.connection.videoOrientation = (AVCaptureVideoOrientation)[[UIApplication sharedApplication] statusBarOrientation];
    }
}

@end
