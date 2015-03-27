class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  scope :approved, -> { where(approved: true) }
  scope :own, -> { where(author: current_user) }
  scope :draft, -> { where(approved: false) }

end
