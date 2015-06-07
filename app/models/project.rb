class Project < ActiveRecord::Base
  validates :title, :presence => true,
  :uniqueness => { :scope => :title,
                     :message => 'must be unique' }
  has_many :items, :dependent => :destroy
end
