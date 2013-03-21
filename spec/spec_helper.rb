if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/config/'
    add_filter '/vendor/'
    add_filter '/lib/tasks/'

    add_group 'Core', 'lib/core'
    add_group 'CRM', 'lib/crm'
    add_group 'Billing', 'lib/billing'
    add_group 'Ticket System', 'lib/ticket_system'
  end
end


# require 'data_mapper'
# DataMapper.setup(:default, 'abstract::')
# DataMapper.setup(:default, 'sqlite::memory:')
# DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/test.sqlite")

# DataMapper::Model.raise_on_save_failure = true

# Dir['./lib/**/*.rb'].each { |f| require f }

# DataMapper.finalize
# DataMapper.auto_migrate!

require 'virtus'

require 'fabrication'
