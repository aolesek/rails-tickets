class Ticket < ApplicationRecord
    
    def valid_price
        if price == nil || price < event.price_low || price > event.price_high 
            errors.add('Ticket price ', 'for this event should be between event %d and %d' % [event.price_low, event.price_high])
        end
    end

    def ticket_limit 
        if event.tickets.length() > 10
            errors.add('Out of tickets! ', 'All available tickets have been booked! Only 10 tickets per event available.')
        end
    end


    validates :name, presence: true, length: {:minimum => 6}
    validates :email_address, :presence => true
    validates :price, numericality: {:greater_than => 0.1 }
    validates :address, presence: true
    validates :phone, :presence => true

    validate :valid_price
    validate :ticket_limit

    belongs_to :event
    belongs_to :user
end
