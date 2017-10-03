require_relative 'entry'

class FileParser
  attr_reader :file, :entries

  def initialize(file)
    @file = file
    @entries = Hash.new
    @entries['data'] = []
    @entries['black'] = {}
    @entries['white'] = {}
  end

  def read_file
    File.read(file).each_line do |line|
      construct_entry(line)
    end
  end

  private

  def construct_entry(line)
    entry = Entry.new(line)

    @entries['data'] << entry

    if entry.piece == 'b'
      if @entries['black'][entry.x.to_i].nil?
        @entries['black'][entry.x.to_i] = {}
      end
      @entries['black'][entry.x.to_i][entry.y.to_i] = 1
    elsif entry.piece == 'w'
      if @entries['white'][entry.x.to_i].nil?
        @entries['white'][entry.x.to_i] = {}
      end
      @entries['white'][entry.x.to_i][entry.y.to_i] = 1
    end
  end
end