require 'rake'

PACKAGES = [
  'chruby',
  'ruby-install',
  'the_silver_searcher',
  'tree',
  'mysql',
  'v8-315',
]

CASKES = [
  'shiftit',
  'slack',
  'macvim',
  'evernote',
  'spotify',
  'dropbox',
]

RUBIES = [
  '2.1.5',
  '2.2.0',
  '2.3.0',
]

NODES = [
  '5.1.0',
  '5.3.0',
  '5.10.0',
]

desc "bootstrap a fresh computer with my preferred settings"
# TODO - create script that installs all brews
task :bootstrap do
  Rake::Task['link'].invoke
  Rake::Task['brew'].invoke
end

desc "install dot files into home directory"
task :link do
        file_black_list = %w{Rakefile README.md NOTES.md aliases vim UltiSnips id_rsa.pub}

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

  puts "Linking public ssh key"
  system %Q{rm "$HOME/.ssh/id_rsa.pub"}
  system %Q{ln -s "$PWD/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"}
end

desc "install all brews and cask required for vim config"
task :brew do
  puts "Updating homebrew..."
  system("brew update")

  puts
  puts "Installing packages..."
  PACKAGES.each { |package| install_package(package) }

  puts
  puts "Installing caskes..." 
  CASKES.each { |cask| install_cask(cask) }
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

def install_package(package)
  puts "  - #{package}"
  system("brew install #{package}")
end

def install_cask
  puts "  - #{cask}"
  system("brew cask install #{cask}")
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
