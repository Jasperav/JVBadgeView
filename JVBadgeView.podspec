Pod::Spec.new do |s|
  s.name             = 'JVBadgeView'
  s.version          = '0.1.9'
  s.summary          = 'A short description of JVBadgeView.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Jasperav/JVBadgeView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jasper' => 'Jasperav@hotmail.com' }
  s.source           = { :git => 'https://github.com/Jasperav/JVBadgeView.git', :tag => s.version.to_s }


  s.ios.deployment_target = '13.0'

  s.source_files = 'JVBadgeView/Classes/**/*'

   s.dependency 'JVView'
   s.dependency 'JVConstraintEdges'
   s.dependency 'JVDebugProcessorMacros'
   s.dependency 'JVContentType'
end
