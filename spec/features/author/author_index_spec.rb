require 'rails_helper'

describe "Index page for authors", type: :feature do
    it "should render" do
        visit authors_path
    end
    it 'has a table' do
        visit authors_path
        expect(page).to have_css 'table'
    end
    it 'has Name and Homepage inside' do
        visit authors_path
        within 'table' do
            expect(page).to have_text 'Name'
            expect(page).to have_text 'Homepage'
        end
    end
    it "should contain a link to new author page" do
        @alan = FactoryBot.create :author
        @alan.save
        visit authors_path
        expect(page).to have_link 'Edit', href: edit_author_path(@alan)
    end

    it "should contain a link to new author page" do
        visit authors_path
        expect(page).to have_link 'New', href: new_author_path
    end

    it "should contain a link to delete author page" do
        @alan = FactoryBot.create :author
        @alan.save
        visit authors_path
        expect(page).to have_link 'Delete', href: author_path(@alan)
    end

    it "should delete author on delete link" do
        @alan = FactoryBot.create :author
        @alan.save
        visit authors_path
        click_link('Delete')
        expect(Author.where(id: @alan.id)).to be_empty
    end

end