class SchoolAdminsController < ApplicationController
  before_action :set_school_admin_id, only: [:schools]

  # POST /school_admin
  # POST /school_admin.json
  def create
    @school_admin = SchoolAdmin.new(admin_params)

    if @school_admin.save
      render json: @school_admin, status: :created, location: @school_admin
    else
      render json: @school_admin.errors, status: :unprocessable_entity
    end
  end

  private
    def admin_params
      params.require(:school_admin).permit(:email, :district_id, :password)
    end
end
