class CreateAdminSalesforces < ActiveRecord::Migration
  def change
    create_table :admin_salesforces do |t|
      t.string :username, limit: 100
      t.string :password, limit: 100
      t.string :client_id, limit: 200
      t.string :client_secret, limit: 200
      t.string :security_token, limit: 200

      t.timestamps null: false
    end
  end
end
