# DWChromecast


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

To install
it, simply add the following lines to your Podfile:

```ruby
source 'https://github.com/AttackOnJasper/DWChromecast.git'


pod 'DWChromecast', :git => 'https://github.com/AttackOnJasper/DWChromecast.git'

pre_install do |installer|
    # workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
    def installer.verify_no_static_framework_transitive_dependencies; end
end
```

## Author

AttackOnJasper, wangdc2010@gmail.com

## License

DWChromecast is available under the MIT license. See the LICENSE file for more info.
