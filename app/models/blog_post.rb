class BlogPost < ActiveRecord::Base
  belongs_to :blogger

  def meta
    meta = ""
    meta = "#{self.blogger.full_name}, " if self.blogger
    meta << self.created_at.strftime('%b %-d, %Y')
  end
end
