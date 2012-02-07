dir = File.dirname(__FILE__)

require 'spec/rails/example/routing_helpers'
require 'spec/rails/example/assigns_hash_proxy'
require "spec/rails/example/render_observer"
require "spec/rails/example/model_example_group"
# require "spec/rails/example/functional_example_group"
# require "spec/rails/example/controller_example_group"
# require "spec/rails/example/helper_example_group"
# require "spec/rails/example/view_example_group"
# require "spec/rails/example/routing_example_group"
# require "spec/rails/example/integration_example_group"
require "spec/rails/example/cookies_proxy"

module Spec
  module Rails
    # Spec::Rails::Example extends Spec::Example (RSpec's core Example module) to provide
    # Rails-specific contexts for describing Rails Models, Views, Controllers and Helpers.
    #
    # == Model Examples
    #
    # These are the equivalent of unit tests in Rails' built in testing. Ironically (for the traditional TDD'er) these are the only specs that we feel should actually interact with the database.
    #
    # See Spec::Rails::Example::ModelExampleGroup
    #
    # == Controller Examples
    #
    # These align somewhat with functional tests in rails, except that they do not actually render views (though you can force rendering of views if you prefer). Instead of setting expectations about what goes on a page, you set expectations about what templates get rendered.
    #
    # See Spec::Rails::Example::ControllerExampleGroup
    #
    # == View Examples
    #
    # This is the other half of Rails functional testing. View specs allow you to set up assigns and render
    # a template. By assigning mock model data, you can specify view behaviour with no dependency on a database
    # or your real models.
    #
    # See Spec::Rails::Example::ViewExampleGroup
    #
    # == Helper Examples
    #
    # These let you specify directly methods that live in your helpers.
    #
    # See Spec::Rails::Example::HelperExampleGroup
    module Example
    end
  end
end



RSpec::configure do |c|
  def c.escaped_path(*parts)
    Regexp.compile(parts.join('[\\\/]'))
  end

  # c.include RSpec::Rails::ControllerExampleGroup, :type => :controller, :example_group => {
  #   :file_path => c.escaped_path(%w[spec controllers])
  # }
  # c.include RSpec::Rails::HelperExampleGroup, :type => :helper, :example_group => {
  #   :file_path => c.escaped_path(%w[spec helpers])
  # }
  # if defined?(RSpec::Rails::MailerExampleGroup)
  #   c.include RSpec::Rails::MailerExampleGroup, :type => :mailer, :example_group => {
  #     :file_path => c.escaped_path(%w[spec mailers])
  #   }
  # end
  c.include RSpec::Rails::ModelExampleGroup, :type => :model, :example_group => {
    :file_path => c.escaped_path(%w[spec models])
  }
  # c.include RSpec::Rails::RequestExampleGroup, :type => :request, :example_group => {
  #   :file_path => c.escaped_path(%w[spec (requests|integration)])
  # }
  # c.include RSpec::Rails::RoutingExampleGroup, :type => :routing, :example_group => {
  #   :file_path => c.escaped_path(%w[spec routing])
  # }
  # c.include RSpec::Rails::ViewExampleGroup, :type => :view, :example_group => {
  #   :file_path => c.escaped_path(%w[spec views])
  # }
end

module Spec
  Runner = ::RSpec
end
