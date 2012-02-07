require 'rspec/matchers/change'
if defined?(ActiveRecord::Base)
  class RSpec::Matchers::Change
    def evaluate_value_proc_with_ensured_evaluation_of_proxy
      value = evaluate_value_proc_without_ensured_evaluation_of_proxy
      ActiveRecord::Associations::AssociationProxy === value ? value.dup : value
    end
    alias_method_chain :evaluate_value_proc, :ensured_evaluation_of_proxy
  end
end
