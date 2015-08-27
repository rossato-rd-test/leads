class Admin::SalesforcesController < ApplicationController
  before_action :set_admin_salesforce, only: [:show, :edit, :update, :destroy]
  # GET /admin/salesforces
  def index
    @admin_salesforces = Admin::Salesforce.all

    if(@admin_salesforces.count == 0)
      redirect_to action: "new"
    else
      redirect_to action: "edit", id: @admin_salesforces[0].id
    end

  end

  # GET /admin/salesforces/1
  def show
    begin
      @salesforce = Databasedotcom::Client.new(:client_id => @admin_salesforce.client_id, :client_secret => @admin_salesforce.client_secret)
      @salesforce.authenticate(:username => @admin_salesforce.username, :password => @admin_salesforce.password + @admin_salesforce.security_token)
      flash[:notice] = "Sucessfully connected to Salesforce account!"
    rescue Databasedotcom::SalesForceError => e
      @salesforce = nil
      flash[:notice] = "Error trying to connect to Salesforce! Message: " + e.message
    end
  end

  # GET /admin/salesforces/new
  def new
    @admin_salesforce = Admin::Salesforce.new
  end

  # GET /admin/salesforces/1/edit
  def edit
  end

  # POST /admin/salesforces
  def create
    @admin_salesforce = Admin::Salesforce.new(admin_salesforce_params)

    if @admin_salesforce.save
      redirect_to @admin_salesforce, notice: 'Salesforce was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/salesforces/1
  def update
    if @admin_salesforce.update(admin_salesforce_params)
      redirect_to @admin_salesforce, notice: 'Salesforce was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/salesforces/1
  def destroy
    @admin_salesforce.destroy
    redirect_to admin_salesforces_url, notice: 'Salesforce was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_salesforce
    @admin_salesforce = Admin::Salesforce.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_salesforce_params
    params.require(:admin_salesforce).permit(:username, :password, :client_id, :client_secret, :security_token)
  end
end
