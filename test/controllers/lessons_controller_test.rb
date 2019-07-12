require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson = lessons(:one)
  end

  test "should get index" do
    get lessons_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_url
    assert_response :success
  end

  test "should create lesson" do
    assert_difference('Lesson.count') do
      post lessons_url, params: { lesson: { attendees_number: @lesson.attendees_number, comments: @lesson.comments, description: @lesson.description, duration: @lesson.duration, end_time: @lesson.end_time, location: @lesson.location, start_time: @lesson.start_time, student_requirements: @lesson.student_requirements, supplied_by_teacher: @lesson.supplied_by_teacher, user_id: @lesson.user_id } }
    end

    assert_redirected_to lesson_url(Lesson.last)
  end

  test "should show lesson" do
    get lesson_url(@lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_url(@lesson)
    assert_response :success
  end

  test "should update lesson" do
    patch lesson_url(@lesson), params: { lesson: { attendees_number: @lesson.attendees_number, comments: @lesson.comments, description: @lesson.description, duration: @lesson.duration, end_time: @lesson.end_time, location: @lesson.location, start_time: @lesson.start_time, student_requirements: @lesson.student_requirements, supplied_by_teacher: @lesson.supplied_by_teacher, user_id: @lesson.user_id } }
    assert_redirected_to lesson_url(@lesson)
  end

  test "should destroy lesson" do
    assert_difference('Lesson.count', -1) do
      delete lesson_url(@lesson)
    end

    assert_redirected_to lessons_url
  end
end
