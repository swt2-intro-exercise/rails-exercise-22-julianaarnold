require "rails_helper"

describe "Edit page for paper", type: :feature do
    it "should render" do
        @paper = FactoryBot.create :paper
        @paper.save
        visit edit_paper_path(@paper)
    end

    it "should contain a multi-select field" do
        @paper = FactoryBot.create :paper
        @paper.save
        visit edit_paper_path(@paper)
        expect(page).to have_css 'select[multiple]'
    end
end