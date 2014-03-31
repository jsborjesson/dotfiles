require 'rake'

namespace :setup do
  desc 'Do all setup tasks'
  task :all do
    Rake::Task["setup:zsh"].invoke
    Rake::Task["setup:symlinks"].invoke
    Rake::Task["setup:osx"].invoke
    Rake::Task["setup:vim"].invoke
    Rake::Task["setup:rvm"].invoke
    Rake::Task["setup:brew"].invoke
  end

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
    # create vim's temp directory
    system %Q{mkdir ~/.tmp}

    # Install Vundle
    unless File.directory? File.expand_path "~/.vim/bundle/vundle"
      puts "Installing Vundle..."
      sh "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
    end

    # Install all the plugins
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

  desc 'Install RVM if not already installed'
  task :rvm do
    unless system("rvm --version")
      puts "Installing RVM..."
      sh "curl -sSL https://get.rvm.io | bash -s stable --ruby"
    end
  end

  desc 'Switch default shell to Zsh'
  task :zsh do
    unless ENV["SHELL"] =~ /zsh/
      puts "Switching to Zsh"
      system %Q{chsh -s `which zsh`}
    end
  end

  desc 'Configure Mac OS using the scripts/osx file'
  task :osx do
    puts "Running scripts/osx..."
    system("sh ./scripts/osx")
    puts "Done! Some of these settings may require a restart."
  end

end

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
