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

require 'spec_helper'

describe Permission do
  pending "add some examples to (or delete) #{__FILE__}"
end
