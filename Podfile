platform :ios, '16.2'
use_frameworks!

target 'ColourfulBall' do

pod 'RxSwift'
pod 'RxCocoa'
pod 'ChameleonFramework', '~> 2.1'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
              config.build_settings['ENABLE_TESTABILITY'] = 'YES'
              config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end