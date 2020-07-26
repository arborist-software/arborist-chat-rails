require %q{arborist_rails/version}
require %q{arborist_rails/tags_helper}

module ArboristRails; end

require %q{arborist_rails/railtie} if defined?(Rails)
