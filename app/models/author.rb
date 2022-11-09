class Author < ApplicationRecord
    validates :last_name, presence: true, length: {minimum: 1}
    has_and_belongs_to_many :papers
    
    def name
        first_name + " " + last_name
    end
end
