require %q{bundler/gem_tasks}
require %q{rake/testtask}

Rake::TestTask.new(:test) do |t|
  t.libs << %q{test}
  t.libs << %q{lib}
  t.test_files = FileList[%q{test/**/*_test.rb}]
end

task :default => :test
