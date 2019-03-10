Pod::Spec.new do |s|
  s.name             = "Swiftest"
  s.summary          = "A short description of Swiftest."
  s.version          = "0.0.15"
  s.homepage         = "github.com/brian/Swiftest"
  s.license          = 'MIT'
  s.author           = { "Brian Strobach" => "brian@appsaurus.io" }
  s.source           = {
    :git => "https://github.com/appsaurus/Swiftest.git",
    :tag => s.version.to_s
  }

  s.swift_version = '4.2'
  s.requires_arc = true

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.2'
  s.watchos.deployment_target = "3.0"

  s.source_files = 'Sources/Swiftest/**/*'

  s.frameworks = 'Foundation'

end
