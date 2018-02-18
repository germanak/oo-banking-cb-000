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
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.sender.close_account
      self.receiver.close_account
      self.status = "complete"
    end
  end

end
