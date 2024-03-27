# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def editable_by?(target_user)
    user && user == target_user
  end

  def deletable_by?(target_user)
    user && user == target_user
  end
end
