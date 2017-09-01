class AccountsController < ApplicationController
	before_action :authenticate_user 

  def index
		@accounts = Account.all
	end

	def show
  	@account = Account.find_by(id: params[:id])
  	if @account.nil?
  		redirect_to accounts_path
  	end
  end

  def create
  	@account = Account.new(account_params)
  	if @account.save
  		redirect_to accounts_path
  	else
  		render action: "new"
  	end
  end

  def edit
  	@account = Account.find(params[:id])	
  end

  def update
  	@account = Account.find(params[:id])
  	if @account.update(account_params)
  		redirect_to accounts_path
  	else
  		render action: "edit"
  	end
  end

  def bill
    @account = Account.find(params[:account_id])
    @month = params[:bill][:month]
    @year = params[:bill][:year]
    if params[:calculate] == "monthly"
      @transactions = @account.transactions.where("cast(strftime('%Y', updated_at) as int) = ? AND cast(strftime('%m', updated_at) as int) = ? AND is_credit = ? ", params[:bill][:year], params[:bill][:month], "0")
    end
    @total = 0
    @transactions.each do |t|
        @total += t.price
    end
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
