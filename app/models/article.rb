class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 140 }
  validates :text, presence: true, length: { maximum: 200000 }
  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true
  
  def subject
    title
  end

  def last_comment
    comments.last
  end  
end
