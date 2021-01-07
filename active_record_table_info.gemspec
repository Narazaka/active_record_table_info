# frozen_string_literal: true

require_relative 'lib/active_record_table_info/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_record_table_info'
  spec.version       = ActiveRecordTableInfo::VERSION
  spec.authors       = ['Narazaka']
  spec.email         = ['info@narazaka.net']
  spec.licenses      = ['Zlib']

  spec.summary       = '`User.table_info` shows columns and indexes like `SHOW CREATE TABLE`'
  spec.homepage      = 'https://github.com/Narazaka/active_record_table_info'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Narazaka/active_record_table_info.git'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
