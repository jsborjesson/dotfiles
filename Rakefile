require 'rake'

# Most of it stolen from r00k/dotfiles

desc 'symlink dotfiles into home directory'
task :install do

  ignore = %w{Rakefile README.md LICENSE}
  replace_all = false

  Dir['*'].each do |file|
    next if ignore.include? file

    full_path = File.join(ENV['HOME'], ".#{file}")

    if File.exists?(full_path) || File.symlink?(full_path)

      # TODO: check if link already points here

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

    system %Q{mkdir ~/.tmp}
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
