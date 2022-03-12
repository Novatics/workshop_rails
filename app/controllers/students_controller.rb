class StudentsController < ApplicationController
  before_action :set_student, only: %i[show update destroy desativar_estudante]

  # GET /students
  def index
    @students = params[:ativos] ? Student.where(active: true) : Student.all
    # usando nosso scope feito na concern
    # @students =  params[:ativos] ? Student.ativos : Student.all

    @students = @students.where(school_class_id: params[:school_class_id]) if params[:school_class_id]

    render json: @students
  end

  # GET /students/1
  def show
    render json: @student
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    @student.school_class_id = params[:school_class_id] if params[:school_class_id]

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  # PATCH /students/1/desativar
  def desativar_estudante
    @student.update(active: false)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :registration, :school_class_id)
  end
end
