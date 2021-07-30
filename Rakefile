# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[spec rubocop]

desc "Refresh the readme's help output section"
task :update_readme_help do
  help_cmd_output = `./exe/pubsubc --help`.chomp!.gsub!(/ +$/, '')
  help = <<~HELP

    ```
    #{help_cmd_output}
    ```

  HELP
  readme = File.read('README.md')
  readme.sub!(%r{(<!-- Help -->\n).*(<!-- /Help -->)}m, '\1%s\2' % help)
  File.write('README.md', readme)
end
