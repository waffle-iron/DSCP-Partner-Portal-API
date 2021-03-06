class ContactsController < ApplicationController
  before_action :authenticate_user
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    contacts = Contact.all
    render json: contacts, :except=> [:created_at, :updated_at]
  end

  def show
    render json: @contact, :except=> [:created_at, :updated_at]
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      head :no_content
    else
      render json: contact.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @contact.destroy
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone,
                                       :phone_alt, :business_name, :website,
                                       :facebook, :instagram, :street_address,
                                       :city, :state, :zip, :partner, :search)
    end
end
