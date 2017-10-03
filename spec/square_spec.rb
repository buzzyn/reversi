require 'spec_helper'

RSpec.describe Square do

  describe 'intiialize' do
    it 'create state' do
      square = Square.new(state)

      expect(square.state).to eq(state)
    end
  end

  describe 'set content' do
    it 'can set content' do
      square = Square.new(state)
      square.set_contents(new_state)

      expect(square.state).to eq(new_state)
    end
  end

  def state
    'A'
  end

  def new_state
    'B'
  end
end
