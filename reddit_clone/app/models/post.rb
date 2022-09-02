# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :string
#  url        :string           not null
#  poster_id  :bigint
#  sub_id     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, presence: true
    validates :url, presence: true, uniqueness: true

    belongs_to :poster,
        foreign_key: :poster_id,
        class_name: :User,
        inverse_of: :posts
    
    belongs_to :sub,
        foreign_key: :sub_id,
        class_name: :Sub,
        inverse_of: :posts


end
