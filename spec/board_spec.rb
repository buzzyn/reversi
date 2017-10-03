require 'spec_helper'

RSpec.describe Board do

  describe 'initialize' do
    it 'create board' do
      @board = Board.new(entries_contents)

      expect(@board.grid.size).to eq(8)
    end
  end

  describe 'initial_board' do
    it 'can initial board with pre-set pieces' do
      @board = Board.new(entries_contents)

      expect(@board.grid[1][3]).not_to be_nil
    end
  end

  def entries_contents
    @entries = []
    @entries << Entry.new('1 3 c')
  end
end
