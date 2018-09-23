# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :blogpost

  validates :content, presence: true
  validates :name, presence: true
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
