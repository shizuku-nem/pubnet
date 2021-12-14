class Post < ApplicationRecord
    has_one_attached :image
    has_many :post_comment, -> {order "created_at ASC"}
    belongs_to:user
end
