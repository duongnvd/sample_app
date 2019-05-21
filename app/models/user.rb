class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  attr_accessor :name, :email

  validates :name, presence: true,
                   length: {maximum: Settings.validation.name_length}
  validates :email, presence: true,
                    length: {maximum: Settings.validation.max_length},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                       length: {minimum: Settings.validation.passw_minl}

  before_save{email.downcase!}

  has_secure_password
end
