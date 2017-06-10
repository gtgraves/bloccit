class User < ActiveRecord::Base
  def before_save
    self.email = email.downcase if email.present?
    name_formatter = name.split
    name_formatter.each do |x|
      x.capitalize!
    end
    self.name = name_formatter.join(" ")
  end

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password
end
