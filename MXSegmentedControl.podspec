Pod::Spec.new do |s|
  s.name             = "MXSegmentedControl"
  s.version          = "0.1.0"
  s.summary          = "A very customizable segmented control for iOS."
  s.description      = <<-DESC
MXSegmentedControl is a segmented control framework for iOS:
- Very customizable UI.
- Supports storyboard design.
- Can be linked with a scroll view.
                       DESC

  s.homepage         = "https://github.com/maxep/MXSegmentedControl"
  s.license          = 'MIT'
  s.author           = { "Maxime Epain" => "maxime.epain@gmail.com" }
  s.source           = { :git => "https://github.com/maxep/MXSegmentedControl.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MaximeEpain'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'MXSegmentedControl/*.swift'
  
end
