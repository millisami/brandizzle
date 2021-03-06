class BrandsController < ApplicationController
  def index
    @brands = Brand.find(:all)
    options = {
      :page => params[:page],
      :brand_id => params[:brand_id],
      :source => params[:source],
      :flag => params[:flag]
    }
    @results = SearchResult.latest(options)
  end
  
  def new
    @brand = Brand.new
  end
  
  def create
    @brand = Brand.new(params[:brand])
    if @brand.save
      flash[:notice] = "Brand successfully created."
      redirect_to edit_brand_path(@brand)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @brand = Brand.find(params[:id])
    @search = Search.new
  end
  
  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(params[:brand])
      flash[:notice] = "Brand updated."
      redirect_to edit_brand_path(@brand)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    flash[:notice] = "Brand deleted."
    redirect_to brands_path
  end
end