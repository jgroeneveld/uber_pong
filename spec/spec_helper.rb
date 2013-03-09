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