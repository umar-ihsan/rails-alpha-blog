class RemoveGenreAndAuthorFromArticles < ActiveRecord::Migration[8.0]
  def change
    remove_column :articles, :genre, :string
    remove_column :articles, :author, :string
  end
end
