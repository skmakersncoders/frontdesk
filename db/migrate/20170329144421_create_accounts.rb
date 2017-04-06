class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :form_name
      t.string :domain_name

      t.timestamps null: false
    end
  end
end
