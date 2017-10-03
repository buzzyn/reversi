require 'spec_helper'

RSpec.describe FileParser do
  let(:file_parser) { FileParser.new('foo/bar') }

  describe 'read_file' do
    it 'read file' do
      allow(File).to receive(:read).and_return(line)
      file_parser.read_file

      expect(file_parser.entries['data'].size).to eq(1)
    end
  end

  def line
    '1 2 3'
  end
end
