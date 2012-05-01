require 'database_cleaner'

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end