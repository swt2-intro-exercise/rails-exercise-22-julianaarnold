require 'rails_helper'

RSpec.describe "papers/edit", type: :view do
  let(:paper) {
    Paper.create!(
      title: "MyString",
      venue: "MyString",
      year: 1
    )
  }

  before(:each) do
    assign(:paper, paper)
  end

  it "renders the edit paper form" do
    render

    assert_select "form[action=?][method=?]", paper_path(paper), "post" do

      assert_select "input[name=?]", "paper[title]"

      assert_select "input[name=?]", "paper[venue]"

      assert_select "input[name=?]", "paper[year]"
    end
  end
end
