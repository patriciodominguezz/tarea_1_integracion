class AddSearchToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :search, :string
  end
end
