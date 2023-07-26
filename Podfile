# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

workspace 'Redwork'

alamofire = 'Alamofire'
alamofireVersion = '~> 5.6.4'

swinject = 'Swinject'
swinjectVersion = '2.8.3'

firebaseAuth = 'FirebaseAuth'
firebaseAuthVersion ='~> 10.12.0'

firebaseAnalytics = 'FirebaseAnalytics'
firebaseAnalyticsVersion = '~> 10.12.0'

target 'Presentation' do
  project 'Presentation/Presentation.xcodeproj'
  use_frameworks! :linkage => :dynamic

  # Pods for Presentation
  pod alamofire, alamofireVersion
  pod 'lottie-ios'
  pod 'SwiftUI-SimpleToast', :git => 'https://github.com/sanzaru/SimpleToast.git'
  pod swinject, swinjectVersion
  pod firebaseAnalytics, firebaseAnalyticsVersion
  pod firebaseAuth, firebaseAuthVersion
end

target 'Infrastructure' do
  project 'Infrastructure/Infrastructure.xcodeproj'
  use_frameworks! :linkage => :dynamic
  # Pods for Infrastructure
  pod alamofire, alamofireVersion
  pod swinject, swinjectVersion
  pod firebaseAnalytics, firebaseAnalyticsVersion
  pod firebaseAuth, firebaseAuthVersion

end

target 'Domain' do
  project 'Domain/Domain.xcodeproj'
  use_frameworks! :linkage => :dynamic
  # Pods for Presentation
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
