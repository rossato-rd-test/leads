class CreateLeads < ActiveRecord::Migration
  
  drop_table 'leads' if ActiveRecord::Base.connection.table_exists? 'leads'
  def change
    create_table :leads do |t|
      t.string :name, limit: 50
      t.string :last_name, limit: 50
      t.string :email, limit: 100
      t.string :company, limit: 100
      t.string :job_title, limit: 100
      t.string :phone, limit: 50
      t.string :website, limit: 100
      t.string :salesforce_id, limit: 50
      t.timestamp :salesforce_updated_at

      t.timestamps null: false
    end
  end
end
