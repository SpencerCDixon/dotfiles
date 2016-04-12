require 'rake'

desc "install dot files into home directory"
task :install do
  file_black_list = %w{Rakefile README.md NOTES.md}

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

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
