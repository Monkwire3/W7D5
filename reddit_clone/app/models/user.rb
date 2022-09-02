# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true

    before_validation :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        
        if user != nil
            return user.is_password?(password) ? user : nil
        else
            return nil
        end
    end

    def ensure_session_token
        self.session_token ||= generate_unique_random_session_token
    end

    def generate_unique_random_session_token
        token = SecureRandom.urlsafe_base64
        token = SecureRandom.urlsafe_base64 while User.find_by(session_token: token) != nil
        return token
    end

    def reset_session_token!
        self.session_token = generate_unique_random_session_token
        self.save!
        return self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        password_obj = BCrypt::Password.new(self.password_digest)
        return password_obj.is_password?(password)
    end


    has_many :subs,
        foreign_key: :moderator_id,
        class_name: :Sub,
        inverse_of: :moderator
    
    has_many :posts,
        foreign_key: :poster_id,
        class_name: :Post,
        inverse_of: :poster

end
