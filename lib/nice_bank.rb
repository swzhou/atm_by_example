require 'sinatra'

get '/' do
  "Welcome to our nice bank."
end

class Account

  def credit(amount)
    @balance = amount
  end

  def debit(amount)
    @balance -= amount
  end

  def balance
    @balance
  end

end

class Teller

  def initialize cash_slot
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    account.debit(amount)
    @cash_slot.dispense(amount)
  end

end

class CashSlot

  def contents
    @amount || raise("I am empty!")
  end

  def dispense amount
    @amount = amount
  end
end