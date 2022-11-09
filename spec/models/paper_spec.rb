require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should not be valid without a title, venue and year" do
    paper = Paper.new(venue: 'ABQ', year: 2000)
    expect(paper).to_not be_valid
    
    paper = Paper.new(title: 'Science, Bitch!', year: 2000)
    expect(paper).to_not be_valid

    
    paper = Paper.new(title: 'Science, Bitch!', venue: 'ABQ')
    expect(paper).to_not be_valid
  end
  it "should have an empty list of authors by default" do
    paper = FactoryBot.create :paper
    expect(paper.authors).to_not be_nil
    expect(paper.authors).to eq([])
  end
end
