require 'active_support/concern'
require 'spec/rails/adapters'

module RSpec
  module Rails
    if defined?(ActiveRecord)
      module FixtureSupport
        extend ActiveSupport::Concern


        included do
          self.fixture_path = RSpec.configuration.fixture_path
          self.use_transactional_fixtures = RSpec.configuration.use_transactional_fixtures
          self.use_instantiated_fixtures  = RSpec.configuration.use_instantiated_fixtures
          fixtures RSpec.configuration.global_fixtures if RSpec.configuration.global_fixtures
        end
      end

      RSpec.configure do |c|
        c.include RSpec::Rails::SetupAndTeardownAdapter
        c.include RSpec::Rails::TestUnitAssertionAdapter
        c.include ActiveRecord::TestFixtures
        c.include RSpec::Rails::FixtureSupport
        c.add_setting :use_transactional_fixtures
        c.add_setting :use_transactional_examples, :alias => :use_transactional_fixtures
        c.add_setting :use_instantiated_fixtures
        c.add_setting :global_fixtures
        c.add_setting :fixture_path
      end
    end
  end
end

# if defined?(ActiveRecord)
#   require 'spec/rails/adapters'
#   
#   module RSpec
#     module Rails
#       if defined?(ActiveRecord)
#         module FixtureSupport
#           extend ActiveSupport::Concern
#           include RSpec::Rails::SetupAndTeardownAdapter
#           include RSpec::Rails::TestUnitAssertionAdapter
# 
#           include ActiveRecord::TestFixtures
#           
#           included do
#             self.fixture_path = RSpec.configuration.fixture_path
#             self.use_transactional_fixtures = RSpec.configuration.use_transactional_fixtures
#             self.use_instantiated_fixtures  = RSpec.configuration.use_instantiated_fixtures
#             fixtures RSpec.configuration.global_fixtures if RSpec.configuration.global_fixtures
#           end
#         end
# 
#         RSpec.configure do |c|
#           c.include RSpec::Rails::FixtureSupport
#           c.add_setting :use_transactional_fixtures
#           c.add_setting :use_transactional_examples, :alias => :use_transactional_fixtures
#           c.add_setting :use_instantiated_fixtures
#           c.add_setting :global_fixtures
#           c.add_setting :fixture_path
#         end
#       end
#     end
#   end
#   # 
#   # 
#   # module Spec::Rails
#   #   module Configuration
#   #     def initialize
#   #       super
#   #       self.fixture_path = RAILS_ROOT + '/spec/fixtures'
#   #     end
#   # 
#   #     def use_transactional_fixtures
#   #       ActiveSupport::TestCase.use_transactional_fixtures
#   #     end
#   #     def use_transactional_fixtures=(value)
#   #       ActiveSupport::TestCase.use_transactional_fixtures = value
#   #     end
#   # 
#   #     def use_instantiated_fixtures
#   #       ActiveSupport::TestCase.use_instantiated_fixtures
#   #     end
#   #     def use_instantiated_fixtures=(value)
#   #       ActiveSupport::TestCase.use_instantiated_fixtures = value
#   #     end
#   # 
#   #     def fixture_path
#   #       ActiveSupport::TestCase.fixture_path
#   #     end
#   #     def fixture_path=(path)
#   #       ActiveSupport::TestCase.fixture_path = path
#   #       ActionController::IntegrationTest.fixture_path = path
#   #     end
#   # 
#   #     def global_fixtures
#   #       ActiveSupport::TestCase.fixture_table_names
#   #     end
#   #     def global_fixtures=(fixtures)
#   #       ActiveSupport::TestCase.fixtures(*fixtures)
#   #     end
#   #   end
#   # end
#   
#   
# end
