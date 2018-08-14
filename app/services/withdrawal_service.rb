module Service
  class Withdrawal

  def initialize(params)
    @account = Account.find(params[:account_id])
    @withdrawal_sum = params[:sum]
  end

  def call
    if @withdrawal_sum <= @account.amount
      new_amount = @account.amount - @withdrawal_sum
      @account.update(amount: new_amount)
      return 'Successfull Withdrawal!'
    else
      return 'Not enough funds'
      end
    end
  end
end
