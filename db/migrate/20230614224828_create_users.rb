class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email,      default: ''
      t.string :name,       limit: 100
      t.boolean :active,    defalt: false
      t.integer :type_user, default: 0

      t.timestamps
    end
  end
end
