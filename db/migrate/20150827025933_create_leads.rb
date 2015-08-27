# Command used to generate
# `rails generate model lead 
#   name:string{50}, last_name:string{50}, email:string{100}, 
#   company:string{100}, job_title:string{100}, phone:string{50}, 
#   website:string{100}, salesforce_id:string{50}, salesforce_updated_at:timestamp`

class CreateLeads < ActiveRecord::Migration
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
