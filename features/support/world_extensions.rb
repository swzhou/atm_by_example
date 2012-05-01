module KnowsTheUserInterface
  class UserInterface
     def withdraw_from(account, amount)

     end
  end

  def my_account
    @my_account ||= Account.new
  end

  def teller
    @teller ||= UserInterface.new
  end

  def cash_slot
    @cash_slot ||= CashSlot.new
  end

end

World(KnowsTheUserInterface)