class Entry
  attr_reader :x, :y, :piece

  def initialize(data)
    @x, @y, @piece = data.split(' ')
  end
end