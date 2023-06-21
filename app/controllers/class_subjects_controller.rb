class ClassSubjectsController < ApplicationController
  before_action :set_class_subject, only: %i[show update destroy]

  # GET /class_subjects
  def index
    @class_subjects = ClassSubject.all

    render json: @class_subjects
  end

  # GET /class_subjects/1
  def show
    render json: @class_subject
  end

  # POST /class_subjects
  def create
    @class_subject = ClassSubject.new(class_subject_params)

    if @class_subject.save
      render json: @class_subject, status: :created, location: @class_subject
    else
      render json: @class_subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /class_subjects/1
  def update
    if @class_subject.update(class_subject_params)
      render json: @class_subject
    else
      render json: @class_subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /class_subjects/1
  def destroy
    reservations = @class_subject.reservations
    reservations.destroy_all
    @class_subject.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_class_subject
    @class_subject = ClassSubject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def class_subject_params
    params.require(:class_subject).permit(:subject, :description, :price, :duration, :image, :tutorName, :user_id)
  end
end
