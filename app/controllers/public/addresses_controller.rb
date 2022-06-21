class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def edit
     @addresses = Address.find(params[:id])
  end
  
  def create
    @addresses = Address.new(address_params)
    @addresses.save
    redirect_to public_addresses_path(@addresses)
  end
  
  def update
    @addresses = Address.find(params[:id])
    @addresses.update(address_params)
    redirect_to public_addresses_path(@addresses[:id])
  end
  
  def destroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
    redirect_to public_addresses_path
  end
  
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
