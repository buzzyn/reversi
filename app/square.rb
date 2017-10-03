class Square
  attr_accessor :state, :image

  def initialize(state)
     @state = state
  end

  def set_contents(state)
    @state = state
  end
end