#ifdef RCT_NEW_ARCH_ENABLED
#import "CameraView.h"

#import <react/renderer/components/RNCameraViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNCameraViewSpec/EventEmitters.h>
#import <react/renderer/components/RNCameraViewSpec/Props.h>
#import <react/renderer/components/RNCameraViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface CameraView () <RCTCameraViewViewProtocol>

@end

@implementation CameraView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<CameraViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const CameraViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<CameraViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<CameraViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> CameraViewCls(void)
{
    return CameraView.class;
}

@end
#endif
