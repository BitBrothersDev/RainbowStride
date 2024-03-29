# frozen_string_literal: true

require_relative 'lib/rainbow_stride/version'

Gem::Specification.new do |spec|
  spec.name        = 'rainbow_stride'
  spec.version     = RainbowStride::VERSION
  spec.authors     = ['Orest Kostiuk']
  spec.email       = ['okostiuk@assurance.com']
  spec.homepage    = 'https://github.com/BitBrothersDev/RainbowStride'
  spec.summary     = 'Summary of RainbowStride.'
  spec.description = 'Description of RainbowStride.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #
  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'chartkick', '>= 5.0.2'
  spec.add_dependency 'groupdate', '>= 6.2.1'
  spec.add_dependency 'haml'
  spec.add_dependency 'rails', '>= 7.0.5'
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'kaminari'
end
