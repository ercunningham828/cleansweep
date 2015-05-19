class PropertiesController < ApplicationController
  def new
    @property=Property.new
  end

  def show
    @property=Property.new
  end

  def delete
  end

  def create
    @property=current_user.properties.build(property_params)

    if @property.save
       flash[:notice] = "Property was saved."
       redirect_to root_path
     else
       flash[:error] = "There was an error saving the property. Please try again."
       render :new
     end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])

    if @property.update_attributes(property_params)
       flash[:notice] = "Property was updated."
       redirect_to root_path
     else
       flash[:error] = "There was an error saving the property. Please try again."
       render :new
     end
  end

   private

  def property_params
    params.require(:property).permit(:name, :street_address,:city,:state,:zipcode,:bathrooms,:bedrooms)
  end
end
