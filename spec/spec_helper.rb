# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'sidekiq/testing'
require 'capybara/email/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include MailerMacros
  config.include FactoryGirl::Syntax::Methods

  config.before(:each) do
    reset_email
    Sidekiq::Testing.inline!
  end
end

def sign_in(user)
  visit "/signin"
  within("#main") do
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
  end
end

def sign_out_and_in_again(email, password)
  click_on "Sign Out"
  click_link "Sign In"
  within("#main") do
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Sign In"
  end
end
