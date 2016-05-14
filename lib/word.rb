class Word
  attr_reader :word, :part_of_speech

  def initialize(word, pos)
    @word = word
    @part_of_speech = pos
  end
end
