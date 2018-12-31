require "rake"

task default: :link

desc "Set up a new computer from scratch (experimental)"
task bootstrap: %i[
  brew
  bash
  link
  vim:install
  osx
]

desc "Symlink dotfiles into home directory"
task :link do
  sh "bash ./link.sh"
end

desc "Install Homebrew"
task :brew do
  unless system("brew --version > /dev/null")
    puts "Installing Homebrew..."
    sh '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  end
  puts "Homebrew is installed."

  sh "brew update"

  puts
  puts "Installing packages from Brewfile"
  sh "brew bundle"

  puts
  puts "Running cleanup tasks"
  sh "brew cleanup"
  sh "brew cask cleanup"
end

desc "Configure Mac OS using the osx.sh file"
task :osx do
  puts "Running osx.sh..."
  sh "bash ./osx.sh"
  puts "Done! Some of these settings may require a restart."
end

desc "Setup Go tools"
task :golang do
  sh "mkdir -p ~/code/go"
  sh "go get -u golang.org/x/tools/cmd/..."
  sh "go get -u github.com/nsf/gocode"
  sh "go get -u github.com/golang/lint/golint"
end

desc "Install global gems"
task :gems do
  sh "gem install bundler"
  sh "bundle install --system"
  sh "rbenv rehash"
end

desc "Install FZF autocompletion and keybindings"
task :fzf do
  sh "/usr/local/opt/fzf/install"
end

desc "Set the new version of bash as the standard shell"
task :bash do
  shell = "/usr/local/bin/bash"

  puts "Making sure #{shell} is in /etc/shells"
  sh 'grep -q "/usr/local/bin/bash" /etc/shells || sudo bash -c "echo /usr/local/bin/bash >> /etc/shells"'
  sh 'cat /etc/shells'
  puts

  puts "Setting #{shell} as the default shell"
  sh "chsh -s #{shell}"
end
