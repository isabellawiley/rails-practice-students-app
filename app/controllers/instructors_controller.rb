class InstructorsController < ApplicationController

    def index
        @instructors = Instructor.all
    end

    def new
        @instructor = Instructor.new
    end

    def create
        @instructor = Instructor.new(instructor_params)

        if @instructor.valid?
            @instructor.save
            redirect_to @instructor
        else
            redirect_to new_instructor_path
        end
    end

    def show
        @instructor = Instructor.find(params[:id])
    end

    def update
        @instructor = Instructor.find(params[:id])
        @instructor.update(instructor_params)
        redirect_to @instructor
    end

    def destroy
        @instructor = Instructor.find(params[:id])
        @instructor.students.destroy_all
        @instructor.destroy
        redirect_to instructors_path
    end

    private

    def instructor_params
        params.require(:instructor).permit(:name)
    end

end
