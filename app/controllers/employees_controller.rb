# app/controllers/employees_controller.rb
class EmployeesController < ApplicationController
    before_action :authorize_admin
    before_action :set_employee, only: [:edit, :update, :destroy]
  
    def index
      @employees = Employee.all
      render json: @employees
    end
  
    def new
      @employee = Employee.new
    end
  
    def create
      @employee = Employee.new(employee_params)
      if @employee.save
        flash[:notice] = "Employee created successfully."
        render json: @employee
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @employee.update(employee_params)
        flash[:notice] = "Employee updated successfully."
        render json: @employee
      else
        render :edit
      end
    end
  
    def destroy
      @employee.destroy
      flash[:notice] = "Employee deleted successfully."
      render json: @employee
    end
  
    private
  
    def authorize_admin
      unless current_user && current_user.role == 'admin'
        flash[:error] = 'Access denied. Only admins can perform employee operations.'
      
      end
    end
  
    def set_employee
      @employee = Employee.find(params[:id])
    end
  
    def employee_params
      params.require(:employee).permit(:full_name, :designation, :department)
    end
  end
  