class WordList
  attr_reader :words

  def initialize(filepath, type)
    @words = File.read(filepath).split(",").map { |w| Word.new(w, type) }
  end
end
