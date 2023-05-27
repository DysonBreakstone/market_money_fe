class VendorsController < ApplicationController
  def show
    @vendor = VendorsFacade.new(params[:id]).vendor
  end
end