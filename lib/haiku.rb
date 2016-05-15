class Haiku
  attr_reader :first_line, :second_line, :third_line

  def initialize
    @first_line = Stanza.new(5).generate!
    @second_line = Stanza.new(7).generate!
    @third_line = Stanza.new(5).generate!
  end
end
