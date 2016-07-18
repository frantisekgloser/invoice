class AddressLinksController < ApplicationController
  before_action :set_address_link, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @address_links = policy_scope(AddressLink)
  end

  def show
  end

  def new
    @address_link = current_user.address_links.build
  end

  def edit
  end

  def create
    @address_link = current_user.address_links.build(address_link_params)
    respond_to do |format|
      if @address_link.save
        format.html { redirect_to @address_link, notice: 'Address link successfully created.' }
        format.json { render :show, status: :created, location: @address_link }
      else
        format.html { render :new }
        format.json { render json: @address_link.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @address_link.update(address_link_params)
        format.html { redirect_to address_links_url, notice: 'Address link was successfully updated.' }
#        format.html { redirect_to @address_link, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @address_link }
      else
        format.html { render :edit }
        format.json { render json: @address_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address_link.destroy
    respond_to do |format|
      format.html { redirect_to address_links_url, notice: 'Address link was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_address_link
      @address_link = AddressLink.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def address_link_params
      params.require(:address_link).permit(:address_type_id, :house_number_id, :user_id)
    end
end    