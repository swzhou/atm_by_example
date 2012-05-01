module KnowsTheDomain
  def my_account
    @my_account ||= Account.new
  end

  def teller
    @teller ||= Teller.new(cash_slot)
  end

  def cash_slot
    @cash_slot ||= CashSlot.new
  end

end

World(KnowsTheDomain)