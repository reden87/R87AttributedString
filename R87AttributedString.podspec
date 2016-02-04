Pod::Spec.new do |s|
  s.name             = "R87AttributedString"
  s.version          = "0.1.0"
  s.summary          = "With the help of R87AttributedString you can format attributed texts easily."

  s.description      = <<-DESC
						You can format attributed texts easily: for example you can add the thext #like this# or *like this* and you can specify from code how the text inside the # and * characters should look like.
					   DESC

  s.homepage         = "https://github.com/reden87/R87AttributedString"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Gergo Nemeth" => "mail@reden87.info" }
  s.source           = { :git => "https://github.com/reden87/R87AttributedString.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/reden87'

  s.platform     = :ios, '4.3'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'Foundation'
end
