class Stanza
  def initialize(max_syllables)
    @max_syllables = max_syllables
    @words = []
    @syllables_unused = @max_syllables
    @current_part_of_speech = "all"
    @max_syllables = 4
  end

  def generate!
    while @syllables_unused > 0
      word = find_word
      @words.push(word)
      @syllables_unused -= word.syllable_count  
      valid_next
      shift_max
    end
    @words.map(&:name).join(" ")
  end

  private

  def find_word
    Word.where(part_of_speech: valid_next,
               syllable_count: (1..@max_syllables).to_a.sample).order("RANDOM()").first
  end

  def shift_max
    @max_syllables = @syllables_unused if @syllables_unused < @max_syllables
  end

  def valid_next
    @current_part_of_speech = send(@current_part_of_speech).sample
  end

  def all
    %w(adjective verb adverb noun)
  end

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
end
