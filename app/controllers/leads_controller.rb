class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :setup_salesforce, except: [:new]
  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        sync_contact(@lead)
        format.html { redirect_to leads_url, notice: 'Lead was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        sync_contact(@lead)
        format.html { redirect_to leads_url, notice: 'Lead was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lead
    @lead = Lead.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lead_params
    params.require(:lead).permit(:name, :last_name, :email, :company, :job_title, :phone, :website, :salesforce_id, :salesforce_updated_at)
  end

  # Setup Salesforce connector
  def setup_salesforce
    if(@salesforce == nil)
      config = Admin::Salesforce.first
      @salesforce = Databasedotcom::Client.new(:client_id => config.client_id, :client_secret => config.client_secret)
      @salesforce.authenticate(:username => config.username, :password => config.password + config.security_token)
    end
  end

  # Sync contact
  def sync_contact (lead)
    setup_salesforce

    params = {"FirstName" => lead.name,
      "LastName" => lead.last_name,
      "Email" => lead.email,
      "Phone" => lead.phone,
      "Title" => lead.job_title,
      "OwnerId" => @salesforce.user_id}

    if lead.salesforce_id != nil && @salesforce.find("Contact", lead.salesforce_id)
      @salesforce.update("Contact", lead.salesforce_id, params)
    else
      c = @salesforce.create("Contact", params)
    c.save()
    lead.salesforce_id = c.Id
    end
    lead.salesforce_updated_at = Date.new()
    lead.save()
  end

end
