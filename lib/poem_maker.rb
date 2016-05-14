class PoemMaker
  attr_reader :adjectives

  def initialize
    @adjectives   = WordList.new("data/adjectives.txt", :adjective)
    @verbs        = WordList.new("data/verbs.txt", :verb)
    @pronouns     = WordList.new("data/pronouns.txt", :pronoun)
    @prepositions = WordList.new("data/prepositions.txt", :preposition)
  end

  def stanza
    poem_stanza_structure.map { |w| w.words.sample.word }.join(" ")
  end

  private

  def poem_stanza_structure
    [@pronouns, @adjectives, @verbs, @prepositions, @pronouns]
  end
end

