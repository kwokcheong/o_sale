class User < ApplicationRecord
    validates :first_name, presence: true, allow_nil: false
    validates :last_name, presence: true, allow_nil: false
    validates :email, presence: true, uniqueness: { case_sensitive: false }, allow_nil: false, format: { with: /\A[A-Z0-9#-_~!$&'()*+,;=:.]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i}

    has_many :products, dependent: :destroy

    has_secure_password


    before_save :downcase_email

    private
        def downcase_email
            self.email.downcase!
        end
end
