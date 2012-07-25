#!/usr/bin/env ruby
require 'rubygems'
require 'translit'

if ARGV[0]
  puts Translit.convert ARGV.join(' ')
else
  output = ""
  while input = STDIN.gets
    if input == ".\n"
      puts output
      break
    else
      output += Translit.convert input
    end
  end
end