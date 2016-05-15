module Importer
  def self.import!
    (1..4).each do |i|
      ['nouns', 'adjectives', 'verbs', 'adverbs'].each do |pos|
        import_words("data/words/#{pos}/#{i}syllable#{pos}.txt", pos.chomp('s'), i)
      end
    end
  end
  
  private

  def self.import_words(filepath, type, syllable_count)
    File.read(filepath).split("\r\n").map do |w| 
      Word.create(name: w.gsub("\"", ""), 
                  part_of_speech: type, 
                  syllable_count: syllable_count)
    end
  end
end

