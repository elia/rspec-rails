module RSpec::Rails
  module ModelExampleGroup
    def self.included base
      base.metadata[:type] = :model
    end
  end
end

# 
# module Spec
#   module Rails
#     module Example
#       # Model examples live in $RAILS_ROOT/spec/models/.
#       #
#       # Model examples use Spec::Rails::Example::ModelExampleGroup, which
#       # provides support for fixtures and some custom expectations via extensions
#       # to ActiveRecord::Base.
#       base = defined?(ActiveRecord::TestCase) ? ActiveRecord::TestCase : ActiveSupport::TestCase
#       class ModelExampleGroup < base
#         RSpec::Core::ExampleGroup.register(:model, self)
#       end
#     end
#   end
# end
