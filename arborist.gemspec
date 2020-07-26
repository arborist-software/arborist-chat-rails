require_relative %q{lib/arborist/version}

Gem::Specification.new do |spec|
  spec.authors               = %w{Leon Pearce}
  spec.description           = %q{adds Arborist live chat to your web app}
  spec.email                 = %w{leonp1991@gmail.com}
  spec.homepage              = %q{http://github.com/arborist-software/arborist-rails}
  spec.name                  = %q{arborist}
  spec.required_ruby_version = Gem::Requirement.new(%q{>= 2.3.0})
  spec.summary               = %q{adds Arborist live chat to your web app}
  spec.version               = Arborist::VERSION

  spec.metadata.store %q{allowed_push_host}, %q{http://github.com/arborist-software/arborist-rails}
  spec.metadata.store %q{changelog_uri},     %q{http://github.com/arborist-software/arborist-rails/CHANGELOG.md}
  spec.metadata.store %q{homepage_uri},      spec.homepage
  spec.metadata.store %q{source_code_uri},   %q{http://github.com/arborist-software/arborist-rails}

  # specify which files should be added to the gem when it is released.
  # the `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(%q{..}, __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_dependency %q{activesupport}, %q{> 3.0}
  spec.add_dependency %q{jwt},           %q{= 2.2.1}


  spec.bindir        = %q{exe}
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]
end
