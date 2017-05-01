Pod::Spec.new do |s|

  s.name         = "Validate"
  s.version      = "0.1.0"
  s.summary      = "Minimal + composable validations in Swift.  BYOBusiness Logic"

  s.description  = <<-DESC
    Validate: Minimal + composable validations in Swift. BYOBusiness Logic. This
    library is intended for data validations and user input validations where you 
    want full ownership over the validations that are run against your data.
  DESC

  s.homepage = "https://github.com/sweetmandm/Validate"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = "David Sweetman"
  s.social_media_url   = "http://twitter.com/d_sweetman"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/sweetmandm/Validate.git", :tag => "#{s.version}" }

  s.source_files  = "Sources/**/*.swift"
end
