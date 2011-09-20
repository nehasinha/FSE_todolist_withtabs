class Task < ActiveRecord::Base
  validates :description, :presence => true
  belongs_to :list

  scope :completed,  where(:completed => true)
  scope :incomplete, where(:completed => false)


  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end

  end
end
