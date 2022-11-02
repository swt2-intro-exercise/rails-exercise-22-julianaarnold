require 'rails_helper'

describe "Show author page", type: :feature do
    it "should display authors details" do
        @alan = FactoryBot.create :author

        visit author_path(@alan)
        expect(page).to have_text("")
    end
end
