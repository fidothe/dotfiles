#!/usr/bin/env ruby
dotfiles_dir = File.expand_path(File.dirname(__FILE__))
initial_root = ENV['HOME']

def process_dir(dir, root, path_prefix = ".")
  Dir["#{dir}/*"].reject {|path| path =~ /install\.rb$/}.each do |dotfile_path|
    if File.file?(dotfile_path)
      puts `ln -svf #{dotfile_path} #{root}/#{path_prefix}#{File.basename(dotfile_path)}`
    elsif File.directory?(dotfile_path)
      dir_path = "#{root}/#{path_prefix}#{File.basename(dotfile_path)}"
      puts `mkdir -pv #{dir_path}`
      process_dir(dotfile_path, dir_path, '')
    end
  end
end

process_dir(dotfiles_dir, initial_root)

