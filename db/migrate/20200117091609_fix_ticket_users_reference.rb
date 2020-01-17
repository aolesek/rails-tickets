class FixTicketUsersReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :ticket, foreign_key: true
  end
end
