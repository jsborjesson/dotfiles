########################################
# My rails application template
########################################
# Documentation: http://guides.rubyonrails.org/generators.html
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
# Manage gems
########################################

# Do not install CoffeeScript
gsub_file "Gemfile", /.*coffee.*/i, ""

# This needs to be run before committing
run "bundle"

########################################
# Configure generators
########################################

say "Configuring Rails generators"

# Disable some annoying generators
initializer "disable_generators.rb", <<CODE
# Disable some annoying generators
Rails.application.configure do
  config.generators do |generate|
    generate.helper false
    generate.assets false
    generate.jbuilder false
  end
end
CODE


########################################
# Ruby version
########################################

create_file ".ruby-version", RUBY_VERSION + "\n"


########################################
# Git
########################################

say "Initializing git repository"

git :init
git add: "."
git commit: "--quiet -m 'Initial commit'"
