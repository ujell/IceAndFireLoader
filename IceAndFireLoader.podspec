Pod::Spec.new do |s|

  s.name         = "IceAndFireLoader"
  s.version      = "1.0"
  s.summary      = "Swift Wrapper for AnApiOfIceAndFire"
  s.homepage     = "https://github.com/ujell/IceAndFireLoader.git"
  s.license      = { :type => "MIT"}
  s.author       = { "yucel" => "yuceluzun@windowslive.com" }
  s.platform     = :ios, "8.0", :osx, "10.9"
  s.source       = { :git => "https://github.com/ujell/IceAndFireLoader.git", :tag => "1.0" }
  s.source_files = "IceAndFireLoader/IceAndFire.swift"
  s.requires_arc = true

end
