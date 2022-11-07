require 'rails_helper'

describe "Edit page for authors", type: :feature do
    it "should render" do
        @alan = FactoryBot.create :author

        visit edit_author_path(@alan)
    end
    it "can be used to edit an authors properties" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)

        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end
    it "should have a 'submit' button" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)
        expect(page).to have_css('input[type="submit"]')
    end
    it "should update author data in the database" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)

        page.fill_in 'author[first_name]', with: 'Max'
        page.fill_in 'author[last_name]', with: 'Mustermann'
        page.fill_in 'author[homepage]', with: 'http://de.wikipedia.org/wiki/Max_Mustermann'
        find('input[type="submit"]').click

        @alan.reload

        expect(@alan.first_name).to eq('Max')
        expect(@alan.last_name).to eq('Mustermann')
        expect(@alan.homepage).to eq('http://de.wikipedia.org/wiki/Max_Mustermann')
    end
    
end