class RenameCommentColmnToReports < ActiveRecord::Migration[6.1]
  def change
    rename_column :reports, :comment, :contents
  end
end
