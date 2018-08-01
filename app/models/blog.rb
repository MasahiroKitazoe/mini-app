class Blog < ApplicationRecord
  belongs_to :user

  validates :text, presence: true

  def show_text
    if self.text.length > 200
      self.text[0, 200] + "..."
    else
      self.text[0, 200]
    end
  end
end
