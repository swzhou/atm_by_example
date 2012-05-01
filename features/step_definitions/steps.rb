require File.join(File.dirname(__FILE__), "..", "..", "lib", "nice_bank")

CAPTURE_CASH_AMOUNT = Transform /^\$(\d+)$/ do |digits|
  digits.to_i
end

Given /^I have deposited (#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  my_account.deposit(amount)
  my_account.balance.should eq(amount),
      "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When /^I withdraw (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  teller.withdraw_from(my_account, amount)
end

Then /^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/ do |amount|
  cash_slot.contents.should == amount
end

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
