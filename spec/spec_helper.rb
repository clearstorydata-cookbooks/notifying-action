require 'chefspec'
require 'chefspec/berkshelf'

require_relative '../libraries/notifying-action.rb'

RSpec.configure do |c|
  c.filter_run(focus: true)
  c.run_all_when_everything_filtered = true
  c.backtrace_exclusion_patterns = []  # show full backtraces
end
