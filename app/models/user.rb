# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar do |image|
    image.variant :thumb, resize_to_limit: [256, 256]
  end
end
