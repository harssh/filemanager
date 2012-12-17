# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  folder_id  :integer
#  can_create :boolean
#  can_read   :boolean
#  can_update :boolean
#  can_delete :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ActiveRecord::Base
  belongs_to :folder
  
  attr_accessible :can_create, :can_delete, :can_read, :can_update
end
