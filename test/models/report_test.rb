# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    me = User.create!(email: 'me@example.com', name: 'me', password: 'password')
    she = User.create!(email: 'she@example.com', name: 'she', password: 'password')

    report = Report.create!(user: me, title: 'test', content: 'test')

    assert report.editable?(me), 'The report should be editable by its creator'
    assert_not report.editable?(she), 'The report should not be editable by others'
  end

  test 'created_on' do
    user = User.create!(email: 'user@example.com', name: 'user', password: 'password')
    report = Report.create!(user:, title: 'test', content: 'test')

    assert_equal Time.zone.today, report.created_at.to_date, 'The report should be created with today\'s date'
  end
end
