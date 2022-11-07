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
end
