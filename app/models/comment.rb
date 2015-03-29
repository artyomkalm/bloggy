class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  scope :approved, -> { where(approved: true) }
  scope :draft, -> { where(approved: nil) }
  validates_presence_of :content
  validates_presence_of :author_id
end
