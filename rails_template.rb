########################################
# Rails Application Template
########################################
# Configure `rails new` a bit further
# Documentation: http://guides.rubyonrails.org/generators.html

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
