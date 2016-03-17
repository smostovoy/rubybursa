class Article < ActiveRecord::Base
  belongs_to :user

  def published?
    created_at < 1.day.ago
  end

  def some_methods
    @sdf
  end
end
