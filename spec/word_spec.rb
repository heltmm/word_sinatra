require('word')
require('rspec')
require('pry')

describe('Word') do
  before() do
    Word.clear()
  end
  describe('#initialize') do
    it("saves initializtion values as intance variables that can be read") do
      word = Word.new({"name" => "hat"})
      expect(word.name).to eq("hat")
    end
  end

  describe('#display') do
    it('returns the list of words') do
      word = Word.new({"name" => "hat"})
      word.save
      expect(Word.display).to eq([word])
    end
  end

  describe('#save') do
    it('saves the chosen word to a class variable called list') do
      word = Word.new({"name" => "hat"})
      word.save
      expect(Word.display[0].name).to eq('hat')
    end
  end

  describe('#search') do
    it('searches for the given word') do
      word = Word.new({"name" => "hat"})
      word.save
      expect(Word.search('hat').name).to eq('hat')
    end
  end

  describe('#remove') do
    it('removes word from list') do
      word = Word.new({"name" => "hat"})
      word.save
      Word.remove('hat')
      expect(Word.display).to eq([])
    end
  end

  describe('#add_definition') do
    it('adds a definition for a chosen word') do
      word = Word.new({"name" => "hat"})
      word.save
      Word.add_definition('hat', 'a piece of apparel worn on the head')
      expect(Word.display[0].definitions[0]).to eq ('a piece of apparel worn on the head')
    end
  end

  describe('#add_link') do
    it('adds a definition for a chosen word') do
      word = Word.new({"name" => "hat"})
      word.save
      Word.add_link('hat', 'https://thelongdark.gamepedia.com/media/thelongdark.gamepedia.com/thumb/4/4b/Basic_Wool_Hat.png/200px-Basic_Wool_Hat.png?version=d4b2a122a5819fdc2a55fcbd4aed0336')

      expect(Word.display[0].link).to eq ('https://thelongdark.gamepedia.com/media/thelongdark.gamepedia.com/thumb/4/4b/Basic_Wool_Hat.png/200px-Basic_Wool_Hat.png?version=d4b2a122a5819fdc2a55fcbd4aed0336')
    end
  end

  describe('#sort') do
    it('sorts the list of words alphabetically') do
      word = Word.new({"name" => "hat"})
      word.save
      word2 = Word.new({'name' => 'acorn'})
      word2.save
      Word.sort
      expect(Word.display[0].name + Word.display[1].name).to eq ('acornhat')
    end
  end

  describe('#clear') do
    it("clears all items from the dictionary ") do
      word = Word.new({"name" => "hat"})
      word.save
      Word.clear()
      expect(Word.display).to eq([])
    end
  end
end
