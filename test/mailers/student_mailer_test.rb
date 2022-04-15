require "test_helper"

class StudentMailerTest < ActionMailer::TestCase
  test "student_welcome" do
    mail = StudentMailer.student_welcome
    assert_equal "Student welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "student_email_confirmation" do
    mail = StudentMailer.student_email_confirmation
    assert_equal "Student email confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
