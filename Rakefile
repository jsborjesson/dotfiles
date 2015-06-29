require 'rake'

# You can set the test mode by running `rake mytask test=true`
puts 'Running in test mode' if ENV['test']

DOTFILES = FileList.new('*').exclude(
  *%w{ Rakefile Brewfile Gemfile Gemfile.lock scripts README.md LICENSE NOTES.md }
)

desc 'Symlink dotfiles into home directory'
task :link do
  DOTFILES.each do |filename|
    Dotfile.new(filename).link
  end
end

task default: :link

desc 'Remove symlinks (smart enough to not delete something else)'
task :unlink do
  DOTFILES.each do |filename|
    Dotfile.new(filename).unlink
  end
end

desc 'Setup Vundle and install plugins'
task :vim do
  # Install Vundle
  unless File.directory?(File.expand_path("~/.vim/bundle/Vundle.vim"))
    puts "Installing Vundle..."
    sh "git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
  end

  puts "Installing Vim plugins..."
  sh "vim +PluginInstall +qall"
end

namespace :nvim do
  desc 'Update NeoVim'
  task :update do
    sh "brew update"
    sh "brew reinstall --HEAD neovim"
  end

  desc 'Install NeoVim, install Plug and update plugins'
  task :install do
    puts "Updating NeoVim"
    sh "brew update && brew install --HEAD neovim"

    puts "Installing python module"
    sh "pip install neovim"

    unless File.directory?(File.expand_path("~/.nvim/autoload/plug.vim"))
      puts "Installing vim-plug"
      sh "curl -fLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

      puts "Installing plugins"
      sh "nvim +PlugInstall +qall"
    end
  end
end

desc 'Install Homebrew'
task :brew do
  unless system("brew --version > /dev/null")
    puts "Installing Homebrew..."
    sh 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  end

  puts "Homebrew is installed."
  puts "Install Homebrew packages either by running ./scripts/brew.sh or copy pasting the commands you need."
end

desc 'Configure Mac OS using the scripts/osx.sh file'
task :osx do
  puts "Running scripts/osx..."
  sh "bash ./scripts/osx.sh"
  puts "Done! Some of these settings may require a restart."
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
    puts "#{to_s.ljust(20)} #{message}"
  end

  def exists?
    File.exists?(destination_path)
  end

  def symlinked?
    File.symlink?(destination_path) && ( File.readlink(destination_path) == source_path )
  end

  def create_symlink
    FileUtils.ln_s(source_path, destination_path) unless ENV['test']
  end

  def remove_symlink
    FileUtils.rm(destination_path) unless ENV['test']
  end

  def destination_path
    File.join(ENV['HOME'], ".#{filename}")
  end

  def source_path
    File.expand_path("./#{filename}")
  end

end
