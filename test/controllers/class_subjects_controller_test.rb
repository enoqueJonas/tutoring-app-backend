require 'test_helper'

class ClassSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_subject = class_subjects(:one)
  end

  test 'should get index' do
    get class_subjects_url, as: :json
    assert_response :success
  end

  test 'should create class_subject' do
    assert_difference('ClassSubject.count') do
      post class_subjects_url,
           params: {
             class_subject: {
               description: @class_subject.description,
               duration: @class_subject.duration,
               price: @class_subject.price,
               subject: @class_subject.subject
             }
           },
           as: :json
    end

    assert_response :created
  end

  test 'should show class_subject' do
    get class_subject_url(@class_subject), as: :json
    assert_response :success
  end

  test 'should update class_subject' do
    patch class_subject_url(@class_subject),
          params: {
            class_subject: {
              description: @class_subject.description,
              duration: @class_subject.duration,
              price: @class_subject.price,
              subject: @class_subject.subject
            }
          },
          as: :json
    assert_response :success
  end

  test 'should destroy class_subject' do
    assert_difference('ClassSubject.count', -1) do
      delete class_subject_url(@class_subject), as: :json
    end

    assert_response :no_content
  end
end
