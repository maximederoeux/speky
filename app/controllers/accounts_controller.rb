class AccountsController < ApplicationController

  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
  	@accounts = Account.all
  end

  def show
  	@account = Account.find(params[:id])
  end

  def edit
  	@account = Account.find(params[:id])
  end

  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save       
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
		@account = Account.find(params[:id])
    respond_to do |format|
      if @account.update(account_params)       
        format.html { redirect_to @account }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

	def set_account
		@account = Account.find(params[:id])
	end


  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:resto_name, :resto_mail, :subdomain, :user_id)
  end
end
