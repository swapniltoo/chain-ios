Pod::Spec.new do |s|
  s.name     = "Chain"
  s.version  = "0.1.4"
  s.summary  = "The Official iOS SDK for Chain's Bitcoin API"
  s.homepage = "https://chain.com"
  s.license  = 'MIT'
  s.author   = {"Matt Matteson" => "matt@chain.com", "Ryan R. Smith" => "ryan@chain.com"}
  s.source   = {:git => "https://github.com/chain-engineering/chain-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/chain'

  s.platform = :ios
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'Chain'
  s.resources = 'Chain/chain.der'
  s.public_header_files = 'Chain/Chain.h'
end
