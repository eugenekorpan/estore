require 'rspec/core/rake_task'

namespace :rcov do
  RSpec::Core::RakeTask.new(:rspec_run) do |t|
    t.pattern = 'spec/**/*_spec.rb'
    t.rcov = true
    t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,lib\/,app\/controllers\/admin\/,app\/controllers\/zendesk_auth_controller.rb,app\/sweepers\/,app\/models\/auditor_observer.rb --aggregate coverage.data}
    t.rcov_opts << %[-o "coverage"]
  end

  task :rspec do |t|
    rm "coverage.data" if File.exist?("coverage.data")
    Rake::Task["rcov:rspec_run"].invoke
  end

end
