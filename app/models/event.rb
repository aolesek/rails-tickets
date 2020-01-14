class Event < ApplicationRecord

    def event_date_not_from_past
        if event_date != nil && event_date < Date.today
            errors.add('Event date', 'should be a valid date and should not be past')
        end
    end

    def event_prices_valid
        if price_low == nil || price_high == nil ||!(price_low > 0.0 && price_high > price_low)
            errors.add('Price', 'low should be greater than 0 and price high should be greater than price low.')
        end
    end

    validates :artist, presence: true
    validates :price_low, numericality: true
    validates :price_high, numericality: true 
    validates :event_date, presence: true
    validate :event_date_not_from_past
    validate :event_prices_valid

    has_many :tickets
end
