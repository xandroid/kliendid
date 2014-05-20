class Aadress < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :maja, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  searchable do
    text :maja
	text :linn
	text(:user_name) { user.name }
  end
end
