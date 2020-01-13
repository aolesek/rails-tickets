class Ticket < ApplicationRecord
    validates :name, presence: true, length: {:minimum => 6}
    validates :email_address, :presence => true
    validates :price, numericality: {:greater_than => 0.1 }
    validates :address, presence: true
end
