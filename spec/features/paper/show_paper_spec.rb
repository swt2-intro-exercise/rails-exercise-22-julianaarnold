require "rails_helper"

describe "Show page for paper", type: :feature do
    it "should render" do
        @paper = FactoryBot.create :paper
        @paper.save
        visit paper_path(@paper)
    end

    it "should contain a list of authors" do
        @paper = FactoryBot.create :paper
        @paper.save
        visit paper_path(@paper)
        expect(page).to have_css 'ul'

        @paper.authors.each do |author|
            expect(page).to have_css 'li', text: author.name
        end
    end
end