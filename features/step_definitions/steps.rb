Given /^I have deposited \$(\d+) in my account$/ do |amount|
  my_account = Account.new
  my_account.deposit(amount.to_i)
  my_account.balance.should eq(amount.to_i)
end

When /^I request \$(\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^\$(\d+) should be dispensed$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

class Account

  def deposit(amount)

  end

  def balance

  end

end