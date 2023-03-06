Gem::Specification.new do |s|
  s.name = 'simplepubsub_drb'
  s.version = '0.1.0'
  s.summary = 'Inspired by SimplePubSub and uses DRb instead of WebSocket.'
  s.authors = ['James Robertson']
  s.files = Dir["lib/simplepubsub_drb.rb"]
  s.add_runtime_dependency('onedrb', '~> 0.4', '>=0.4.2')
  s.add_runtime_dependency('xml-registry', '~> 0.8', '>=0.8.0')
  s.signing_key = '../privatekeys/simplepubsub_drb.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/simplepubsub_drb'
end
