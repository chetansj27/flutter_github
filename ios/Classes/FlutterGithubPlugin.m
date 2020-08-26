#import "FlutterGithubPlugin.h"
#if __has_include(<flutter_github/flutter_github-Swift.h>)
#import <flutter_github/flutter_github-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_github-Swift.h"
#endif

@implementation FlutterGithubPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterGithubPlugin registerWithRegistrar:registrar];
}
@end
