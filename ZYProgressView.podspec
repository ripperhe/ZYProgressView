Pod::Spec.new do |s|
  s.name             = 'ZYProgressView'
  s.version          = '0.1.0'
  s.summary          = 'A simple progress view.'
  s.homepage         = 'https://github.com/ripperhe/ZYProgressView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ripper' => 'ripperhe@qq.com' }
  s.source           = { :git => 'https://github.com/ripperhe/ZYProgressView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZYProgressView/**/*'

  # s.resource_bundles = {
  #   'ZYProgressView' => ['ZYProgressView/Assets/*.png']
  # }

  #s.subspec 'ZYProgressView' do | sm |
      #sm.source_files = 'ZYProgressView/ZYSubModule/**/*'
      #sm.dependency 'AFNetworking', '~> 2.3'
  #end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
