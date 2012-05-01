require_relative 'transaction_queue'
require_relative 'account'

transaction_queue = TransactionQueue.new

puts "transaction processor ready"
loop do
  transaction_queue.read do |message|
    sleep 1
    transaction_amount, number = message.split(/,/)
    account = Account.find_by_number!(number.strip)
    account.balance += transaction_amount.to_i
    account.save
  end
end