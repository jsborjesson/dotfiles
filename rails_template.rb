########################################
# My rails application template
########################################
#
# Generates a new rails app the way I want it.
#
# Use like this:
#
#     rails new test_app -m rails_template.rb -B -J -T
#
# The extra options (skipping bundle, js and test_unit) can be
# placed in your .railsrc
#
# Test easily by running this:
#
#     rm -rf test_app && rails new test_app -m rails_template.rb -B -J -T

########################################
# Add testing and development gems
########################################

gem_group :development, :test do
  gem 'rspec-rails'
end

gem_group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'did_you_mean'
  gem 'quiet_assets'
end

gem_group :test do
  gem 'simplecov', require: false
end

generate 'rspec:install'

# uncomment the entire standard config block
gsub_file 'spec/spec_helper.rb', /=(begin|end)\n/, ''

# turn off profile examples by default
comment_lines 'spec/spec_helper.rb', /profile_examples/

# Configure SimpleCov
prepend_to_file 'spec/spec_helper.rb', <<CODE
require 'simplecov'
SimpleCov.start 'rails'

CODE

# Ignore SimpleCov output
append_to_file '.gitignore', '/coverage'


########################################
# Cleanups
########################################

# Markdown readme
remove_file 'README.rdoc'
create_file 'README.md', "# #{@app_name}"

# I hate concerns
remove_dir 'app/controllers/concerns'
remove_dir 'app/models/concerns'

# Make the application.css into scss
run "mv app/assets/stylesheets/application.css app/assets/stylesheets/application.css.scss"

# Disable some annoying generators
inject_into_class 'config/application.rb', "Application", <<CONFIG

    # Disable some annoying generators
    config.generators do |generate|
      generate.helper false
      generate.assets false
    end

CONFIG


run 'bundle'

########################################
# Git
########################################
git :init
git add: "."
git commit: "--quiet -m 'Initial commit'"
