# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CINewsCD' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CINewsCD
  pod 'Swinject'
  pod 'Kingfisher', '~> 7.0'

  target 'CINewsCDTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CINewsCDUITests' do
    # Pods for testing
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # ✅ macOS 14 CI fix (App + Tests + UITests)
      config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'

      # ✅ Extra safety for test targets
      if target.name.include?('Tests')
        config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end
  end
end


