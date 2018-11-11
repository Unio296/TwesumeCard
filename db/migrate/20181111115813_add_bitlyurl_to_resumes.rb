class AddBitlyurlToResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :bitly_url, :string
  end
end
