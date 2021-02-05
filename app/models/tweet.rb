class Tweet < ApplicationRecord
  validates :text, presence: true
  # 空の投稿は保存しない
  belongs_to :user
  # 一つの投稿は一人の投稿
  has_many :comments
  def self.search(search)
    if search != ""
      # searchに値が入ったら
      Tweet.where('text LIKE(?)', "%#{search}%")
      # searchをふくむtextを取得
    else
      Tweet.all
    end
  end
end
