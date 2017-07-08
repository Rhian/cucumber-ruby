# frozen_string_literal: true

require 'pathname'

desc 'Make all files use UNIX (\n) line endings'
task :fix_cr_lf do
  utf8_files = FileList.new('**/*') do |fl|
    fl.exclude { |f| File.directory?(f) }
    fl.exclude(/iso-8859-1/)
  end

  paths = utf8_files.map { |f| Pathname(f) }

  paths.each do |path|
    content = path.read.gsub(/\r?\n/, "\n")
    path.write(content)
  end
end
