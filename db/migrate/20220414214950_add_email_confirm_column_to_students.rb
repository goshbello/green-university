class AddEmailConfirmColumnToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :email_confirmed, :boolean, :default => false
    add_column :students, :confirm_token, :string
  end
end
