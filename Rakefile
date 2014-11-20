require 'rake'

# You can set the test mode by running `rake mytask test=true`
puts 'Running in test mode' if ENV['test']

DOTFILES = FileList.new('*').exclude(
  *%w{ Rakefile Brewfile Gemfile Gemfile.lock scripts README.md LICENSE }
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

desc 'Install Homebrew'
task :brew do
  unless system("brew --version")
    puts "Installing Homebrew..."
    sh 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
  end

  puts "Install Homebrew packages either by running ./scripts/brew.sh or copy pasting the commands you need."
end

desc 'Configure Mac OS using the scripts/osx.sh file'
task :osx do
  puts "Running scripts/osx..."
  sh "bash ./scripts/osx.sh"
  puts "Done! Some of these settings may require a restart."
end

desc 'Install latest stable ruby and global gems from Gemfile'
task :ruby do
  sh "ruby-install ruby"
  sh "bundle install --system"
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
      info("FILE EXISTS")
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
