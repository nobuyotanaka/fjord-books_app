class RemoveCommentableFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_reference :comments, :commentable, null: false, foreign_key: true
  end
end
