module KnowsTheUserInterface
  class UserInterface
    include Capybara::DSL

    def withdraw_from(account, amount)
      Sinatra::Application.account = account
      visit '/'
      fill_in 'Amount', :with => amount
      click_button 'Withdraw'
    end
  end

  def my_account
    @my_account ||= Account.create!(:number => "test", :balance => 0)
  end

  def teller
    @teller ||= UserInterface.new
  end

  def cash_slot
    Sinatra::Application.cash_slot
  end

end

World(KnowsTheUserInterface)