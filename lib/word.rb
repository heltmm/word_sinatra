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


end
