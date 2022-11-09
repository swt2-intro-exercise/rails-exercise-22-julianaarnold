require "rails_helper"

describe "Index page for papers", type: :feature do
    it "should render" do
        visit authors_path
    end
    it 'has a table' do
        visit authors_path
        expect(page).to have_css 'table'
    end
    it "should contain a link to edit paper page" do
        @paper = FactoryBot.create :paper
        @paper.save
        visit papers_path
        expect(page).to have_link 'Edit', href: edit_paper_path(@paper)
    end
    
    it "should contain a link to destroy paper" do
        @paper = FactoryBot.create :paper
        @paper.save
        visit papers_path
        expect(page).to have_link 'Delete', href: paper_path(@paper)
    end
end