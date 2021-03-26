Pod::Spec.new do |spec|

  spec.name         = "AmazingWeakSequence"
  spec.version      = "1.0.1"
  spec.summary      = "Sequence that holds weak references to its elements."

  spec.homepage     = "https://github.com/khamitimur/AmazingWeakSequence"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author    = "Timur Khamidov"

  spec.ios.deployment_target = "11.0"

  spec.source       = { :git => "https://github.com/khamitimur/AmazingWeakSequence.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/**/*.swift"
  
  spec.swift_versions = ['5.0']

end
