class Event < ApplicationRecord


    validates :artist, presence: true
    validates :price_low, numericality: true
    validates :price_high, numericality: true 
    validates :event_date, presence: true
end
