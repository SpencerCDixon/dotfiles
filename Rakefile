require 'rake'

desc "bootstrap a fresh computer with my preferred settings"
task :bootstrap do
  # TODO - create script that installs all brews
  Rake::Task['link'].invoke
end

desc "install dot files into home directory"
task :link do
  file_black_list = %w{Rakefile README.md NOTES.md aliases vim UltiSnips}

  replace_all = false
  Dir['*'].each do |file|
    next if file_black_list.include?(file)
    
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
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
      end
    else
      link_file(file)
    end
  end 

  # Eventually link publish ssh key so all computers use the same,
  # for now just going to ignore this.
  #
  # puts "Linking public ssh key"
  # system %Q{rm "$HOME/.ssh/id_dsa.pub"}
  # system %Q{ln -s "$PWD/id_dsa.pub" "$HOME/.ssh/id_dsa.pub"}
end

# TODO
desc "install all brews and cask required for vim config"
task :brew do
end

desc "displays all command line aliases"
task :aliases do
  File.open(File.join(ENV['HOME'], '.dotfiles/aliases'), 'r') do |file|
    file.each_line do |line|
      puts line 
    end
  end
end

#####################
# Utility Functions #
#####################

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
