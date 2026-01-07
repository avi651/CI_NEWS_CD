platform :ios, '15.0'

use_frameworks!

target 'CINewsCD' do
  pod 'Kingfisher'
  pod 'Swinject'
end

# ❌ UITests me koi pod nahi
target 'CINewsCDUITests' do
  inherit! :search_paths
end

# 🔧 CI FIX
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
    end
  end
end

