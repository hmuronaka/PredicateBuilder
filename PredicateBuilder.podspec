Pod::Spec.new do |spec|

  spec.name         = "PredicateBuilder"
  spec.version      = "1.0.0"
  spec.summary      = "PredicateBuilder is for building an NSPredicate object super easily"
  spec.homepage     = "https://github.com/hmuronaka/PredicateBuilder"
  spec.license      = "MIT"
  spec.author       = { "hmuronaka" => "capriccio27@gmail.com" }

  spec.ios.deployment_target = "10.3"

  spec.source       = { :git => "https://github.com/hmuronaka/PredicateBuilder.git", :tag => "#{spec.version}" }
  spec.source_files  = "PredicateBuilder/src/*.swift"
  #spec.exclude_files = "Classes/Exclude"

  spec.swift_version = '5.0'
  spec.requires_arc = true

end
