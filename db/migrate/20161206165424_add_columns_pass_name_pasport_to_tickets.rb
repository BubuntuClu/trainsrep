class AddColumnsPassNamePasportToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :pas_name, :string
    add_column :tickets, :pas_pasport, :string
  end
end
