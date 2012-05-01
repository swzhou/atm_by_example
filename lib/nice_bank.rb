require 'sinatra'

get '/' do
  %{
<html>
  <body>
    <form action="/withdraw" method="post">
      <label for="amount">Amount</label>
      <input type="text" id="amount" name="amount"/>
      <button type="submit">Withdraw</button>
    </form>
  </body>
</html>
  }
end

post '/withdraw' do
  fail "I don't know how to withdraw yet, sorry"
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