require 'rails_helper'

feature 'ideas' do

  context 'no ideas have been added' do

    scenario 'displays a prompt to add a new idea' do
      visit 'ideas'
      expect(page).to have_content 'No ideas yet'
      expect(page).to have_link 'Add an idea'
    end
  end

end
