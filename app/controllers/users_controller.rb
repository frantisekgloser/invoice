class UsersController < ApplicationController
  after_action :verify_authorized

  def show
    sign_out :user
    redirect_to home_index_path
  end

  def edit
    redirect_to home_index_path
  end  

  def update
    user = User.find(params[:id])

    authorize user
    user.assign_attributes(user_params)

    if user.save
      redirect_to home_index_path
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :street, :trade_subject, :identification_number, :vat, :house_number, :city_part, :city, :postal_code, :province, :country, :phone, :mail, :web, :note, :bank, :bank_account, :iban, :swift)
    end
end