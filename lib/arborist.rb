require %q{arborist/version}
require %q{arborist/tags_helper}

module Arborist; end

require %q{arborist/railtie} if defined?(Rails)
