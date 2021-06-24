class Jot < ApplicationRecord
  belongs_to :image

  def formatted_date
    self.event_datetime.strftime("%A, %B %e %Y, at %l:%M%P")
  end

  def date_to_number
    self.event_datetime.to_s(:number)
  end
end
