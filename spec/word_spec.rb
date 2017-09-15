require('contact')
require('rspec')
require('pry')

describe('Word') do
  word = Word.new({"name" => "hat"})

  describe('#initialize') do
    it("saves initializtion values as intance variables that can be read") do
      expect(word.name).to eq("hat")
    end
  end

  describe('#save') do
    word.save()
    it('saves the chosen word to a class variable called list') do
      expect(@@list[0].name).to eq('hat')
    end
  end

  describe('#search') do
    it('searches for the given word') do
      expect(Word.search('hat').name).to eq('hat')
    end
  end

  describe('#remove') do
    it('removes word from list') do
      
  end

  describe('#add_definition') do
    it('adds a definition for a chosen word') do
      Word.add_definition('hat', 'a piece of apparel worn on the head')
      expect(@@list[0].definition).to eq ('a piece of apparel worn on the head')
    end
  end

  describe('#add_link') do
    it('adds a definition for a chosen word') do
      Word.add_definition('hat', 'https://thelongdark.gamepedia.com/media/thelongdark.gamepedia.com/thumb/4/4b/Basic_Wool_Hat.png/200px-Basic_Wool_Hat.png?version=d4b2a122a5819fdc2a55fcbd4aed0336')

      expect(@@list[0].link).to eq ('https://thelongdark.gamepedia.com/media/thelongdark.gamepedia.com/thumb/4/4b/Basic_Wool_Hat.png/200px-Basic_Wool_Hat.png?version=d4b2a122a5819fdc2a55fcbd4aed0336')
    end
  end
end
