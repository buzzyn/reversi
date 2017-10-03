require 'spec_helper'

RSpec.describe FileParser do
  describe 'initialize' do
    it 'create Entry object' do
      entry = Entry.new(line)

      expect(entry.x).to eq('x')
      expect(entry.piece).to eq('z')
    end
  end

  def line
    'x y z'
  end
end
