class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end