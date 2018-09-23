# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end
