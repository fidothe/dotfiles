#!/usr/bin/env ruby
dotfiles_dir = File.expand_path(File.dirname(__FILE__))
Dir["#{dotfiles_dir}/*"].reject {|path| path =~ /install\.rb$/}.each do |dotfile_path|
  #cmd = "ln -svf #{path} ~/.#{File.basename(path)}"
  puts `ln -svf #{dotfile_path} #{ENV['HOME']}/.#{File.basename(dotfile_path)}`
end
