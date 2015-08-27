class Admin::SalesforcesController < ApplicationController
  before_action :set_admin_salesforce, only: [:show, :edit, :update, :destroy]

  # GET /admin/salesforces
  # GET /admin/salesforces.json
  def index
    @admin_salesforces = Admin::Salesforce.all
  end

  # GET /admin/salesforces/1
  # GET /admin/salesforces/1.json
  def show
  end

  # GET /admin/salesforces/new
  def new
    @admin_salesforce = Admin::Salesforce.new
  end

  # GET /admin/salesforces/1/edit
  def edit
  end

  # POST /admin/salesforces
  # POST /admin/salesforces.json
  def create
    @admin_salesforce = Admin::Salesforce.new(admin_salesforce_params)

    respond_to do |format|
      if @admin_salesforce.save
        format.html { redirect_to @admin_salesforce, notice: 'Salesforce was successfully created.' }
        format.json { render :show, status: :created, location: @admin_salesforce }
      else
        format.html { render :new }
        format.json { render json: @admin_salesforce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/salesforces/1
  # PATCH/PUT /admin/salesforces/1.json
  def update
    respond_to do |format|
      if @admin_salesforce.update(admin_salesforce_params)
        format.html { redirect_to @admin_salesforce, notice: 'Salesforce was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_salesforce }
      else
        format.html { render :edit }
        format.json { render json: @admin_salesforce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/salesforces/1
  # DELETE /admin/salesforces/1.json
  def destroy
    @admin_salesforce.destroy
    respond_to do |format|
      format.html { redirect_to admin_salesforces_url, notice: 'Salesforce was successfully destroyed.' }
      format.json { head :no_content }
    end
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
