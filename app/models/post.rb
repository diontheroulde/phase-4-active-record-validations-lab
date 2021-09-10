class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :clickbait?

  CLICKBAIT = [
    /Won't Believe/,
    /Secret/,
    /Top [number]/,
    /Guess/
  ]
  
  def clickbait?
    unless CLICKBAIT.any? { |cb| cb.match(title) }
      errors.add(:title, "not clickbait")
    end
  end
  
end
