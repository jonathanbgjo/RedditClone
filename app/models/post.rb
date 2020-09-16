class Post < ApplicationRecord
    validates :title, presence: true
    validates :subs, presence: true
    # validates :description, :url, optional:true
    # belongs_to :sub

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    has_many :post_subs

    has_many :subs,
        through: :post_subs,
        source: :sub
        
    has_many :comments
end




# t.string "title", null: false
#     t.string "url"
#     t.string "content"
#     t.integer "sub_id", null: false
#     t.integer "author_id", null: false