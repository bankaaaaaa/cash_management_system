class TransactionsController < ApplicationController
	before_action :authenticate_user, :account

	def index
		@transactions = @account.transactions
		@expence_total = 0
		@expence = "false"
		@credit = "false"
		@credit_total = 0
		@transactions.each do |t|
			if t.is_credit != "0"
				@credit_total += t.price
				@credit = "true"
			else
				@expence_total += t.price
				@expence = "true"
			end
		end
	end

	def show
		@transaction = Transaction.find(params[:id])
		@acc = Account.find(params[:account_id])
	end

	def new
	end

	def create
		#byebug
		@transaction = @account.transactions.build(transaction_param.merge({:approved => "no", :created_by => current_user.name }))
		if @transaction.save
			redirect_to account_transactions_path
		else
			render plain: @transaction.errors.inspect
		end
	end

	def edit
		@transaction = Transaction.find(params[:id]);
	end

	def update
		if @account.transactions.find(params[:id]).update(transaction_param)
			redirect_to account_transactions_path(@account.id)
		else
			render action: "transactions/edit"
		end
	end

	def destroy
		if Transaction.find(params[:id]).destroy
			redirect_to account_transactions_path
		else
			render plain: "can not delete".inspect
		end
	end

	def approve
		if current_user.is_admin == "1"
			if params[:approved] == "yes"
				@account.transactions.find(params[:transaction_id]).update({:approved => current_user.name})
			else
				@account.transactions.find(params[:transaction_id]).update({:approved => "rejected"})
			end
		else
			flash[:danger] = "only admin can approve/reject"
		end
		redirect_to account_transactions_path(@account.id)
	end

	private
	
	def transaction_param
		params.require(:transaction).permit(:price, :description, :is_credit)
	end

	def account
		@account = Account.find(params[:account_id])
	end

end
