require 'rake'
Dir.glob('tasks/*.rake').each { |file| import file }

# Most of it stolen from r00k/dotfiles

namespace :setup do
  desc 'Do all setup tasks'
  task :all do
    Rake::Task["setup:zsh"].invoke
    Rake::Task["setup:symlinks"].invoke
    Rake::Task["setup:vim"].invoke
    Rake::Task["setup:rvm"].invoke
  end

  desc 'Symlink dotfiles into home directory'
  task :symlinks do
    ignore = %w{Rakefile Brewfile scripts README.md LICENSE}
    replace_all = false

    Dir['*'].each do |file|
      next if ignore.include? file

      full_path = File.join(ENV['HOME'], ".#{file}")

      if File.exists?(full_path)

        # symlink already exists
        if File.symlink?(full_path)
          if File.readlink(full_path) == File.expand_path("./#{file}")
            puts "~/.#{file} already symlinked"
            next
          end
        end

        replace_file(file) and next if replace_all

        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          puts 'aborting'
          exit
        else
          puts "skipping"
        end

      else
        link_file(file)
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



def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end
