class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
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
end
