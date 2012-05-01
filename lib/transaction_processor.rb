require_relative 'balance_store'
require_relative 'transaction_queue'

transaction_queue = TransactionQueue.new
balance_store = BalanceStore.new
puts "transaction processor ready"
loop do
  transaction_queue.read do |message|
    sleep 1
    transaction_amount = message.to_i
    new_balance = balance_store.balance + transaction_amount
    balance_store.balance = new_balance
  end
end