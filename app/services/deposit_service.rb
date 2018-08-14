module Service
  class Deposit

  def initialize(params)
    @account = Account.find(params[:account_id])
    @deposit_sum = params[:sum]
  end

  def call
    new_amount = @account.amount - @deposit_sum
    @account.update(amount: new_amount)
      return 'Successfull Deposit!'
    end
  end
end
