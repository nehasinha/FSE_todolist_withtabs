class Task < ActiveRecord::Base
  validates :description, :presence => true
  belongs_to :list

  scope :completed,  where(:completed => true)
  scope :incomplete, where(:completed => false)


def self.search(search,list)
    if search
     ## puts "inside index.....2"
     ## @task = list.tasks
     ## puts "@list.length #{list}"
     ## puts @task
      where("list_id = '#{list.id}' AND description LIKE?", "%#{search}%" )
      ##@task.find(:all, :conditions => ['description LIKE ?', "%#{search}%"] )

    else
      puts "inside index.....3"
      puts "@list: #{list}"
     ## puts "@list.tasks: #{list.tasks}"
    #  puts "params[:list_id]: #{params[:list_id]}"
 #     puts "@tasks: #{@tasks}"
      puts "inside index.....4"




     ## list.tasks
    ## scoped
      where("list_id = '#{list.id}'" )
    end
  end



=begin
  def self.search(search)
    if search
      find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
    else
      find(:all)
    end

  end
=end

end
