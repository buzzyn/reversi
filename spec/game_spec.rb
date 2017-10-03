require 'spec_helper'

RSpec.describe Game do

  describe 'initialize' do
    it 'new game' do
      game = Game.new(contents)

      expect(game.board.entries.first.piece).to eq('b')
      expect(game.board.grid.size).to eq(8)
    end
  end

  def contents
    @entries = Hash.new
    @entries['data'] = []
    @entries['black'] = {}
    @entries['white'] = {}

    @entries['data'] << Entry.new('1 3 b')

    @entries['black'][1]={}
    @entries['black'][1][2]=1

    @entries['white'][3]={}
    @entries['white'][3][4]=1

    return @entries
  end
z`