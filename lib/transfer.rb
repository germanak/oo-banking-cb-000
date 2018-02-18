class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if valid?
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      @sender.close_account
      @receiver.close_account
      @status = "complete"
    else
      self.status = "rejected"
      "Transaction #{self.status}. Please check your account balance."
    end
  end

end
