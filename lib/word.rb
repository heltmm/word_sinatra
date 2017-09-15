class Word
  @@list = []

  attr_accessor :name, :definition, :link

  def initialize(hash)
    @name = hash['name']
    @definition = ''
    @link = ''
  end

  def self.display
    @@list
  end

  def save
    @@list.push(self)
  end

  def self.search(name)
    @@list.each do |word|
      if name == word.name
        return word
      end
    end
  end

  def self.remove(name)
    @@list.delete(Word.search(name))
  end

  def self.add_definition(name, definition)
    Word.search(name).definition = definition
  end

  def self.add_link(name, link)
      Word.search(name).link = link
  end


end
