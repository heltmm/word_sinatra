require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('You have', {:type => :feature}) do
  before() do
    Word.clear()
  end
  it('add a word to the list') do
    visit('/')
    fill_in('name', :with => 'Apple')
    click_button('✓Add a Word!')
    expect(page).to have_content('Apple')
  end
  it('click link of word added to list') do
    visit('/')
    fill_in('name', :with => 'Apple')
    click_button('✓Add a Word!')
    click_link('Apple')
    expect(page).to have_content('Apple')
  end
  it('add definition to a word page') do
    visit('/')
    fill_in('name', :with => 'Apple')
    click_button('✓Add a Word!')
    click_link('Apple')
    expect(page).to have_content('Apple')
    fill_in('definition', :with => 'tasty fruit')
    click_button('Add Definition!')
    expect(page).to have_content('Definition 1: tasty fruit')
  end
  it('add an image to a word page') do
    visit('/')
    fill_in('name', :with => 'Apple')
    click_button('✓Add a Word!')
    click_link('Apple')
    expect(page).to have_content('Apple')
    fill_in('link', :with => 'https://www.thesun.co.uk/wp-content/uploads/2017/01/gettyimages-185071735.jpg?strip=all&w=960')
    click_button('Add an Image!')
    expect(page).to have_xpath("//img[contains(@src,'https://www.thesun.co.uk/wp-content/uploads/2017/01/gettyimages-185071735.jpg?strip=all&w=960')]")
  end
  it('add definition to a word page') do
    visit('/')
    fill_in('name', :with => 'Apple')
    click_button('✓Add a Word!')
    click_link('Apple')
    click_button('Delete')
    expect(page).to have_no_content('Apple')
  end
  it('see all words and definitions') do
    visit('/')
    fill_in('name', :with => 'Apple')
    click_button('✓Add a Word!')
    fill_in('name', :with => 'Tree')
    click_button('✓Add a Word!')
    click_button('See all Words and Definitions')
    expect(page).to have_content('Apple No Definition added yet Tree No Definition added yet')
  end
  it('add a word to the list') do
    visit('/')
    fill_in('name', :with => 'Apple')
    click_button('✓Add a Word!')
    click_button('Look at a random word')
    expect(page).to have_content('No Definition added yet')
  end
end
