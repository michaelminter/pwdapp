class UserLocationsController < ApplicationController
  # GET /user_locations
  # GET /user_locations.json
  def index
    @user_locations = UserLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_locations }
    end
  end

  # GET /user_locations/1
  # GET /user_locations/1.json
  def show
    @user_location = UserLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_location }
    end
  end

  # GET /user_locations/new
  # GET /user_locations/new.json
  def new
    @user_location = UserLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_location }
    end
  end

  # GET /user_locations/1/edit
  def edit
    @user_location = UserLocation.find(params[:id])
  end

  # POST /user_locations
  # POST /user_locations.json
  def create
    @user_location = UserLocation.new(params[:user_location])

    respond_to do |format|
      if @user_location.save
        format.html { redirect_to @user_location, notice: 'User location was successfully created.' }
        format.json { render json: @user_location, status: :created, location: @user_location }
      else
        format.html { render action: "new" }
        format.json { render json: @user_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_locations/1
  # PUT /user_locations/1.json
  def update
    @user_location = UserLocation.find(params[:id])

    respond_to do |format|
      if @user_location.update_attributes(params[:user_location])
        format.html { redirect_to @user_location, notice: 'User location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_locations/1
  # DELETE /user_locations/1.json
  def destroy
    @user_location = UserLocation.find(params[:id])
    @user_location.destroy

    respond_to do |format|
      format.html { redirect_to user_locations_url }
      format.json { head :no_content }
    end
  end
end
