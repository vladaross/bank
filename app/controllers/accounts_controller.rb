class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = current_user.accounts
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @transactions = current_user.transactions
  end

  # GET /accounts/new
  def new
    @account = current_user.transactions.build
  end

  def deposit
    Service::Deposit.new(params).call
    redirect_to root_path, notice: message
  end

  def withdrawal
    Service::Withdrawal.new(params).call
    redirect_to root_path, notice: message
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = current_user.accounts.build(account_params)


    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:user_id, :currency, :amount)
    end
end
