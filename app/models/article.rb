class Article < ActiveRecord::Base
  belongs_to :user

  def published?
    @sdf = true
  end

  def some_methods
    @sdf
  end
end
