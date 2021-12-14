class Post < ApplicationRecord
    has_one_attached :image
    has_many :post_comments, -> {order "created_at DESC"}
    belongs_to:user
end
