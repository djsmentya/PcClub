conn = { :adapter => 'sqlite3', :database => './db/pcclub.sqlite3' }

ActiveRecord::Base.establish_connection(conn)


class ComputerLog < ActiveRecord::Base

    connection.create_table :computer_logs, :force => true do |t|
        t.belongs_to :computer
        t.string     :description
        t.timestamps
    end

    belongs_to :computer
end


