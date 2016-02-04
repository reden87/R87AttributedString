Pod::Spec.new do |s|
  s.name             = "R87AttributedString"
  s.version          = "0.1.0"
  s.summary          = "A short description of R87AttributedString."

  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/R87AttributedString"
  s.license          = 'MIT'
  s.author           = { "Gergo Nemeth" => "reden87@gmail.com" }
  s.source           = { :git => "https://github.com/reden87/R87AttributedString.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/reden87'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'Foundation'
end
