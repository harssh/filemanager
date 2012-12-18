class UserFiles < ActiveRecord::Base
  belongs_to :folder
  belongs_to :user
  attr_accessible :attachment_content_type, :attachment_file_name, :attachment_file_size, :attachment_updated_at
end
