# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex_direct/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'http', '~> 4.3'
  spec.name          = 'yandex_direct'
  spec.version       = YandexDirect::VERSION
  spec.authors       = ['Aleksandr B. Ivanov']
  spec.email         = ['radanisk@gmail.com']

  spec.summary       = 'A Ruby interface to the Yandex Direct API'
  spec.description   = 'A Ruby interface to the Yandex Direct API.'
  spec.homepage      = 'https://github.com/radanisk/yandex_direct'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
