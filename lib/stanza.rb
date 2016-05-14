class Stanza
  def initialize(max_syllables)
    @max_syllables
  end

  def generate!
  end

  private

  def random_word
    Word.offset(rand(Word.count)).first
  end
end
