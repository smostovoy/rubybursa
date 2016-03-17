require 'rails_helper'

RSpec.feature "Publishings", type: :feature do
  it 'shows articles' do
    visit "/articles"
    expect(page).to have_text("Статьи")
  end
end
