class Computer < ActiveRecord::Base
    connection.create_table :computers, :force => true do |t|
        t.integer :number
        t.timestamps
    end

    has_many :computer_logs
end


