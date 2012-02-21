spec = Gem::Specification.new do |s|
  s.name = 'rsipgate'
  s.version = "0.2"
  s.author = ["Alexander Simonov", "Corny", "Averell"]
  s.email = "alex@simonov.me"
  s.homepage = "http://github.com/simonoff/rsipgate"
  s.platform = Gem::Platform::RUBY
  s.summary = "send fax through sipgate and check their sending status"
  s.files = Dir.glob("{lib}/**/*.rb") + %w{ README.md MIT-LICENSE }
  s.require_path = 'lib'
  s.required_ruby_version = '>= 1.8.7'
end