class Paper < ApplicationRecord
    
    validates :title, presence: true, length: {minimum: 1}
    validates :venue, presence: true, length: {minimum: 1}
    validates :year, presence: true, numericality: { only_integer: true }
end
