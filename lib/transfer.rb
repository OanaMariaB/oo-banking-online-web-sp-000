class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.status == "open" && @receiver.status == "open"
      true
    else
      false
    end
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status = "completed"
       @receiver.balance -= @amount
       @sender.balance += @amount
       @status = "reversed"
    end
  end


end
