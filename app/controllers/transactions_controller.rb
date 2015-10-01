class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit, :update, :destroy]

  def home
    @total = Transaction.total
  end

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def edit
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to transactions_path, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to transactions_path, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
      redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:recipient, :transaction_type, :amount)
    end
end
