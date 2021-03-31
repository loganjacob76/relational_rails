class EmployeesController < ApplicationController
  def index
    @employees = Employee.where(employee_of_the_month: 'true')
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
  end

  def create
    employee = Employee.new({
      bookstore_id: params[:bookstore_id],
      name: params[:employee][:name],
      employee_of_the_month: params[:employee][:employee_of_the_month] ? true : false,
      age: params[:employee][:age]
    })
    employee.save
    redirect_to "/bookstores/#{params[:bookstore_id]}/employees"
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    employee = Employee.find(params[:id])
    employee.update({
      name: employee_params[:name],
      age: employee_params[:age],
      bookstore_id: employee_params[:bookstore_id],
      employee_of_the_month: employee_params[:employee_of_the_month].to_i > 0
    })
    redirect_to "/employees/#{params[:id]}"
  end

  def employee_params
    params.permit(:bookstore_id, :name, :employee_of_the_month, :age)
  end

  def destroy
    Employee.destroy(params[:id])
    redirect_to '/employees'
  end
end
