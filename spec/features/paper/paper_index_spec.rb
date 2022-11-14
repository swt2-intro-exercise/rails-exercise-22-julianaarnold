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

    it "should allow filtering by year" do
        @paper1950 = FactoryBot.create :paper
        @paper1950.year = 1950
        @paper1950.title = "Paper from 1950"
        @paper1950.save

        @paper1968 = FactoryBot.create :paper
        @paper1968.year = 1968
        @paper1968.title = "Paper from 1968"
        @paper1968.save

        visit papers_path(year: 1950)

        expect(page).to have_text("Paper from 1950")
        expect(page).not_to have_text("Paper from 1968")
    end
end