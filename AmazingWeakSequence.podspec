Pod::Spec.new do |spec|

  spec.name        = 'AmazingWeakSequence'
  spec.version     = '1.2.3'
  spec.summary     = 'Sequence that holds weak references to its elements.'

  spec.homepage    = 'https://github.com/khamitimur/AmazingWeakSequence'
  spec.license     = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors     = { 'Timur Khamidov' => 'baton237@gmail.com' }
  spec.source      = { :git => 'https://github.com/khamitimur/AmazingWeakSequence.git', :tag => spec.version }

  spec.ios.deployment_target     = '11.0'
  spec.osx.deployment_target     = '10.14'
  spec.tvos.deployment_target    = '11.0'
  spec.watchos.deployment_target = '4.0'

  spec.swift_versions            = ['5.0']

  spec.source_files  = 'Sources/**/*.swift'

end
