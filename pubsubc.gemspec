# frozen_string_literal: true

require_relative 'lib/pubsubc/version'

Gem::Specification.new do |spec|
  spec.name          = 'pubsubc'
  spec.version       = Pubsubc::VERSION
  spec.authors       = ['Brendan Weibrecht']
  spec.email         = ['brendan@weibrecht.net.au']

  spec.summary       = 'TODO'
  spec.homepage      = 'https://github.com/ZimbiX/pubsubc'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/releases"

  spec.license = 'GPL-3.0'

  spec.files = Dir.glob(
    %w[
      exe/**/*
      lib/**/*
      README.md
    ],
  )
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'clamp', '~> 1.3.2'
  spec.add_dependency 'jazz_fingers', '~> 6.2.0'
  spec.add_dependency 'rainbow', '~> 3.0.0'
end
