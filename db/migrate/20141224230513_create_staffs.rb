class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :role
      t.string :office
      t.string :group
      t.string :job_title
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
