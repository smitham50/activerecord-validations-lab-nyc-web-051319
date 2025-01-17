class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Non-Fiction Fiction) }
  validate :clickbait

  def clickbait
    if self.title != nil
      if !self.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        errors.add(:title, "Not Clickbait!")
      end
    end
  end

end
