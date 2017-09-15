class Word
  @@dictionary = []

  attr_accessor :name, :definitions, :link

  def initialize(hash)
    @name = hash['name']
    @definitions = []
    @link = ''
  end

  def self.display
    @@dictionary
  end

  def save
    if self.name != ""
      @@dictionary.push(self)
    end
  end

  def self.search(name)
    @@dictionary.each do |word|
      if name == word.name
        return word
      end
    end
  end

  def self.remove(name)
    @@dictionary.delete_at(Word.display.index(Word.search(name)))
  end

  def self.add_definition(name, definition)
    Word.search(name).definitions.push(definition)
  end

  def self.add_link(name, link)
      Word.search(name).link = link
  end

  def self.sort
    @@dictionary.sort_by! {|word| word.name.downcase}
  end

  def self.random
    @@dictionary.sample(1)
  end

  def self.clear()
    @@dictionary = []
  end

end
