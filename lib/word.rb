class Word
  @@dictionary = []

  attr_accessor :name, :definition, :link

  def initialize(hash)
    @name = hash['name']
    @definition = ''
    @link = ''
  end

  def self.display
    @@dictionary
  end

  def save
    @@dictionary.push(self)
  end

  def self.search(name)
    @@dictionary.each do |word|
      if name == word.name
        return word
      end
    end
  end

  def self.remove(name)
    @@dictionary.delete(Word.search(name))
  end

  def self.add_definition(name, definition)
    Word.search(name).definition = definition
  end

  def self.add_link(name, link)
      Word.search(name).link = link
  end

  def self.sort
    @@dictionary.sort_by! {|word| word.name}
  end

  def self.random
    @@dictionary.sample(1)
  end

end
