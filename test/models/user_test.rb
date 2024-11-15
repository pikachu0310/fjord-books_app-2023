# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email returns email when name is empty' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email, 'Expected email to be returned when name is empty'
  end

  test '#name_or_email returns name when name is present' do
    user = User.new(email: 'foo@example.com', name: 'Foo Bar')
    assert_equal 'Foo Bar', user.name_or_email, 'Expected name to be returned when name is present'
  end
end
