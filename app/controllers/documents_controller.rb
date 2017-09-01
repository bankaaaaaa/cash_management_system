class DocumentsController < ApplicationController
	before_action :transaction, :except => [:update]

	def create
  		if params.key?(:document)
  			@document = Document.new(document_params.merge({:transaction_id => params[:transaction_id]}))
			if @document.save
				flash[:success] = "The file was added!"
			else
				flash[:danger] = "File can't be uploaded"
			end
  		else
  			flash[:danger] = "please select a image or pdf file"
  		end
  		redirect_to account_transactions_path(@transaction.account_id)
	end

	def edit
		@document = Document.find(params[:id])
	end

	def update
		@document = Document.find(params[:id])
		@transaction = Transaction.find(params[:document][:transaction_id])
  		if @document.update(document_params)
  			redirect_to account_transactions_path(@transaction.account_id)
  		else
  			render action: "documents/edit"
  	end
	end

	def destroy
		@doc = Document.find(params[:id])
		@doc.destroy
		flash[:success] = "Document has been deleted"
		redirect_to account_transactions_path(@transaction.account_id)
	end

	private

	def document_params
		params.require(:document).permit(:doc)
	end

	def transaction
    	@transaction = Transaction.find(params[:transaction_id])
  	end
end
