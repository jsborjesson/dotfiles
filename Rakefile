require 'rake'

desc 'Do all setup tasks'
task :all => [:symlinks, :osx, :vim, :brew]

desc 'Symlink dotfiles into home directory'
task :symlinks do
  ignore = %w{Rakefile Brewfile scripts README.md LICENSE}
  replace_all = false

  Dir['*'].each do |file|
    next if ignore.include? file

    unless File.exists?(link_path(file))
      link_file!(file)
      puts file_info(file, "symlinked")
    else
      if symlinked?(file)
        puts file_info(file, "already symlinked")
        next
      end

      if replace_all
        puts file_info(file, "symlinked (force)")
        replace_file(file)
        next
      end

      print file_info(file, "exists, overwrite? [yna]: ")
      case $stdin.gets.chomp
      when 'a'
        puts "replacing all..."
        replace_all = true
        redo
      when 'y'
        replace_file!(file)
        puts file_info(file, "replaced")
      else
        puts file_info(file, "skipped")
      end

    end
  end
end

desc 'Setup Vundle and install plugins, create temp dir'
task :vim do
  system "mkdir ~/.tmp"

  # Install Vundle
  unless File.directory? File.expand_path "~/.vim/bundle/Vundle.vim"
    puts "Installing Vundle..."
    sh "git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
  end

  puts "Installing Vim plugins..."
  sh "vim +PluginInstall +qall"
end

desc 'Setup Homebrew and install packages in Brewfile'
task :brew do
  unless system("brew --version")
    puts "Installing Homebrew..."
    sh 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
  end

  puts "Installing Homebrew packages..."
  sh 'brew bundle'
end

desc 'Configure Mac OS using the scripts/osx file'
task :osx do
  puts "Running scripts/osx..."
  sh "bash ./scripts/osx"
  puts "Done! Some of these settings may require a restart."
end

desc 'Install latest stable ruby and global gems from Gemfile'
task :ruby => :brew do
  sh "ruby-install ruby"
  sh "bundle install --system"
end

task default: :symlinks

### Helper functions ###

def link_path(file)
  File.join(ENV['HOME'], ".#{file}")
end

def source_path(file)
  File.expand_path("./#{file}")
end

def human_readable_path(file)
  "~/.#{file}"
end

def file_info(file, message)
  "#{human_readable_path(file).ljust(20)} #{message}"
end

def symlinked?(file)
  File.symlink?(link_path(file)) && ( File.readlink(link_path(file)) == source_path(file) )
end

def link_file!(file)
  system %Q{ln -s "#{source_path file}" "#{link_path file}"}
end

def replace_file!(file)
  system %Q{rm "#{link_path file}"}
  link_file!(file)
end
