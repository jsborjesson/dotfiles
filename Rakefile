require 'rake'

# Most of it stolen from r00k/dotfiles

desc 'symlink dotfiles into home directory'
task :install do

  ignore = %w{Rakefile README.md LICENSE}
  replace_all = false

  Dir['*'].each do |file|
    next if ignore.include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))

      # TODO: check if link already points here

      print "overwrite ~/.#{file}? [ynaq]"
      case $stdin.gets.chomp
      when 'a'
        replace_all = true
        replace_file(file)
      when 'y'
        replace_file(file)
      when 'q'
        exit
      else
        puts "skipping ~/.#{file}"
      end

    else
      link_file(file)
    end

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
