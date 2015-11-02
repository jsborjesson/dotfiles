require "rake"

# You can set the test mode by running `rake mytask test=true`
puts "Running in test mode" if ENV["test"]

EXCLUDES = %w{ Rakefile Brewfile Gemfile Gemfile.lock *.sh README.md LICENSE NOTES.md }
DOTFILES = FileList.new("*").exclude(*EXCLUDES)

desc "Symlink dotfiles into home directory"
task :link do
  DOTFILES.each do |filename|
    Dotfile.new(filename).link
  end
end

task default: :link

desc "Remove symlinks (smart enough to not delete something else)"
task :unlink do
  DOTFILES.each do |filename|
    Dotfile.new(filename).unlink
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
    puts "Symlinking files into .config directory"
    sh "mkdir -p ~/.config"
    sh "ln -si ~/.nvim ~/.config/nvim"
    sh "ln -si ~/.nvimrc ~/.config/nvim/init.vim"

    puts "Installing python module"
    sh "pip install neovim"

    unless File.exist?(File.expand_path("~/.nvim/autoload/plug.vim"))
      puts "Installing vim-plug"
      sh "curl -fLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

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
  puts "Install Homebrew packages either by running ./brew.sh or copy pasting the commands you need."
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

### Helper class ###

class Dotfile
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def link
    if symlinked?
      info("already symlinked")
    elsif exists?
      info("EXISTS")
    else
      create_symlink
      info("symlinked")
    end
  end

  def unlink
    if symlinked?
      remove_symlink
      info("symlink removed")
    else
      info("ignored")
    end
  end

  def to_s
    "~/.#{filename}"
  end

  private

  def info(message)
    puts "#{to_s.ljust(25)} #{message}"
  end

  def exists?
    File.exists?(destination_path)
  end

  def symlinked?
    File.symlink?(destination_path) && ( File.readlink(destination_path) == source_path )
  end

  def create_symlink
    FileUtils.ln_s(source_path, destination_path) unless ENV["test"]
  end

  def remove_symlink
    FileUtils.rm(destination_path) unless ENV["test"]
  end

  def destination_path
    File.join(ENV["HOME"], ".#{filename}")
  end

  def source_path
    File.expand_path("./#{filename}")
  end
end
