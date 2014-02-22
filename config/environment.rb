# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the app's custom environment variables here, before environments/*.rb
environment_variables = File.join(Rails.root, 'config', 'initializers', 'environment_variables.rb')
load(environment_variables) if File.exists?(environment_variables)

# Initialize the Rails application.
Groceryator::Application.initialize!
