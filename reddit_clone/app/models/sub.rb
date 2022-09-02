# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  moderator_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true

    has_many :posts,
        foreign_key: :sub_id,
        class_name: :Post,
        inverse_of: :sub
    
    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User,
        inverse_of: :subs
end
