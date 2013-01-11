class Page < ActiveRecord::Base
  attr_accessible :title, :body, :key
  validates :title,
    :length => { :minimum => 0, :maximum => 255 },
    :presence => true

  validates :key,
    :format => { :with => /^[a-z0-9_-]+$/i },
    :presence => true,
    :uniqueness => true

  validates :body,
    :presence => true


  def body
    read_attribute(:body).to_s.html_safe
  end
  def body= value
    write_attribute(:body, Redcarpet::Render::SmartyPants.render(value))
  end
  def title
    read_attribute(:title).to_s.html_safe
  end
  def title= value
    write_attribute(:title, Redcarpet::Render::SmartyPants.render(value))
  end
end
