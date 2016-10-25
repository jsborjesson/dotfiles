require "rake"
require "./lib/dotfile"

# All files that should be simply symlinked into ~ with a leading .
DOTFILE_PATHS = %w[
  alias
  bash_profile
  bashrc
  bashrc.local
  bin/
  bundle/
  emacs
  gemrc
  git_template/
  gitconfig
  gitignore
  hushlogin
  inputrc
  jrnl_config
  path
  pryrc
  psqlrc
  rails_template.rb
  railsrc
  tmux.conf
  vim
  vimrc
]

# The files that need to go elsewhere
DOTFILE_PATHS << ["fish/", "~/.config/fish"]
DOTFILE_PATHS << ["Shortcuts.json", "~/Library/Application Support/Spectacle/Shortcuts.json"]
DOTFILE_PATHS << ["private.xml", "~/Library/Application Support/Karabiner/private.xml"]

DOTFILES = DOTFILE_PATHS.map { |path| Dotfile.new(*path) }

task default: :link

desc "Set up a new computer from scratch"
task bootstrap: [:bash,
                 :brew,
                 :link,
                 :"vim:install",
                 :osx,
                 :"karabiner:load"]

desc "Symlink dotfiles into home directory"
task :link do
  DOTFILES.each(&:link)
end

desc "Remove symlinks (smart enough to not delete something else)"
task :unlink do
  DOTFILES.each(&:unlink)
end

namespace :vim do
  desc "Install vim plugins"
  task :install do
    unless File.exist?(File.expand_path("~/.vim/autoload/plug.vim"))
      puts "Installing vim-plug"
      sh "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

      puts "Installing plugins"
      sh "vim +PlugInstall +qall"
    end
  end
end

namespace :nvim do
  desc "Update NeoVim"
  task :update do
    sh "brew update"
    sh "brew reinstall --HEAD neovim"
    sh "pip install neovim --upgrade"
  end

  desc "Install and set up NeoVim dependencies"
  task :install => :link do
    sh "brew tap neovim/neovim"
    sh "brew install neovim"

    puts "Symlinking files into .config directory"
    sh "mkdir -p ~/.config"
    sh "ln -sf ~/.vim ~/.config/nvim"
    sh "ln -sf ~/.vimrc ~/.config/nvim/init.vim"

    puts "Installing python module"
    sh "pip install neovim"

    unless File.exist?(File.expand_path("~/.nvim/autoload/plug.vim"))
      puts "Installing vim-plug"
      sh "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

      puts "Installing plugins"
      sh "nvim +PlugInstall +qall"
    end
  end
end

desc "Install Homebrew"
task :brew do
  unless system("brew --version > /dev/null")
    puts "Installing Homebrew..."
    sh 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  end
  puts "Homebrew is installed."

  puts "Installing packages from brew.sh"
  sh "sh ./brew.sh"
end

desc "Configure Mac OS using the osx.sh file"
task :osx do
  puts "Running osx.sh..."
  sh "bash ./osx.sh"
  puts "Done! Some of these settings may require a restart."
end

namespace :karabiner do
  desc "Overwrite karabiner.sh with current Karabiner settings"
  task :save do
    sh "/Applications/Karabiner.app/Contents/Library/bin/karabiner export > ./karabiner.sh"
  end

  desc "Load Karabiner settings from karabiner.sh"
  task :load do
    sh "sh ./karabiner.sh"
  end
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
