class StudentsController < ApplicationController

    def index
        @students = Student.all
    end

    def new
        @student = Student.new
        @instructors = Instructor.all
    end

    def create
        @student = Student.new(student_params)

        if @student.valid?
            @student.save
            redirect_to @student
        else
            redirect_to new_student_path
        end
    end

    def show
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to @student
    end

    def destroy
        @student = Student.find(params[:id])
        @student.destroy
        redirect_to students_path
    end

    private

    def student_params
        params.require(:student).permit(:name, :major, :age, :instructor_id)
    end

end
