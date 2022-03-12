class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: %i[ show update destroy estudantes ]

  # GET /school_classes
  def index
    @school_classes = SchoolClass.all

    render json: @school_classes
  end

  # GET /school_classes/1
  def show
    render json: @school_class
  end

  # POST /school_classes
  def create
    @school_class = SchoolClass.new(school_class_params)

    if @school_class.save
      render json: @school_class, status: :created, location: @school_class
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /school_classes/1
  def update
    if @school_class.update(school_class_params)
      render json: @school_class
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /school_classes/1
  def destroy
    @school_class.destroy
  end

  # GET /school_classes/1/students
  def estudantes
    render json: @school_class.students
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_class
      @school_class = SchoolClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_class_params
      params.require(:school_class).permit(:code)
    end
end
