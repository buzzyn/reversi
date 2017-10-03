#!/usr/bin/env ruby

require_relative '../app/file_parser'
require_relative '../app/game'


file = '../data/pieces.dat'

parser = FileParser.new(file)
parser.read_file

game = Game.new(parser.entries)
game.start

puts
puts "Black greedy move: #{game.potential_move}"
