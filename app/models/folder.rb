# == Schema Information
#
# Table name: folders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Folder < ActiveRecord::Base
  acts_as_tree2 :order => 'name'
  
  attr_accessible :name
  
  
  validates_uniqueness_of :name , :scope => :parent_id
  
  
end
