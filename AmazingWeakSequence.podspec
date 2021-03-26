Pod::Spec.new do |spec|

  spec.name         = "AmazingWeakSequence"
  spec.version      = "1.0.2"
  spec.summary      = "Sequence that holds weak references to its elements."

  spec.homepage     = "https://github.com/khamitimur/AmazingWeakSequence"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author    = "Timur Khamidov"

  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "10.14"
  spec.tvos.deployment_target = "11.0"
  spec.watchos.deployment_target = '4.0'

  spec.source       = { :git => "https://github.com/khamitimur/AmazingWeakSequence.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/**/*.swift"
  
  spec.swift_versions = ['5.0']

end
