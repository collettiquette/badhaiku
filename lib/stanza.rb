class Stanza
  def initialize(max_syllables)
    @max_syllables = max_syllables
    @words = []
  end

  def generate!
    syllables_used = @max_syllables
    pos = ""
    max = 4
    while syllables_used > 0
      word = Word.where(part_of_speech: valid_next(pos), 
                        syllable_count: (1..max).to_a.sample).order("RANDOM()").first
      @words.push(word)
      syllables_used -= word.syllable_count  
      max = syllables_used if syllables_used < max
    end
    @words.map(&:name).join(" ")
  end

  def valid_next(pos)
    return %w(adjective verb adverb noun).sample if pos == ""
    send(pos).sample
  end

  private

  def adjective
    %w(verb noun)
  end

  def verb
    %w(noun)
  end

  def noun
    %w(adverb adjective adverb)
  end

  def adverb
    %w(verb)
  end

  def random_word
    Word.offset(rand(Word.count)).first
  end
end
