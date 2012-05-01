module KnowsTheUserInterface
  class UserInterface
    include Capybara::DSL

    def withdraw_from(account, amount)
      visit '/'
      fill_in 'Amount', :with => amount
      click_button 'Withdraw'
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