require "rake"

# You can set the dry_run mode by running `rake mytask dry_run=true`
puts "Running in dry_run mode" if ENV["dry_run"]

EXCLUDES = %w{
  *.sh
  Brewfile
  Gemfile
  Gemfile.lock
  LICENSE
  NOTES.md
  README.md
  Rakefile
  private.xml
}
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

namespace :vim do
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

  desc "Link the private.xml to where it is loaded by Karabiner"
  task :link do
    private_xml = File.expand_path("./private.xml")
    destination = File.expand_path("~/Library/Application Support/Karabiner/private.xml")
    FileUtils.ln_sf(private_xml, destination)
  end
end

desc "Link Shortcuts.json to where Spectacle wants it"
task :spectacle do
  shortcuts_json = File.expand_path("./Shortcuts.json")
  destination = File.expand_path("~/Library/Application Support/Spectacle/Shortcuts.json")
  FileUtils.ln_sf(shortcuts_json, destination)
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
end

### Helper class ###

class Dotfile
  FILENAME_ALIGN_WIDTH = 25

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
    "~/#{dotfilename}"
  end

  private

  def dotfilename
    ".#{filename}"
  end

  def info(message)
    puts "#{to_s.ljust(FILENAME_ALIGN_WIDTH)} #{message}"
  end

  def exists?
    File.exists?(destination_path)
  end

  def symlinked?
    File.symlink?(destination_path) && File.readlink(destination_path) == source_path
  end

  def create_symlink
    FileUtils.ln_s(source_path, destination_path) unless ENV["dry_run"]
  end

  def remove_symlink
    FileUtils.rm(destination_path) unless ENV["dry_run"]
  end

  def destination_path
    File.join(ENV["HOME"], dotfilename)
  end

  def source_path
    File.expand_path("./#{filename}")
  end
end
