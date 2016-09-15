FactoryGirl.define do
 
 sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
      email
      password '12test34'
      trade_subject 'test_trade_subject'
      identification_number '500 11'
      house_number 1
      city 'test_city'
      postal_code '456'
      country 'test_country'
  end

  factory :address_link do
    association :user
    association :address_type
    association :house_number
  end

  factory :address_type do
    association :user
    name 'test_address_type_name'
  end

  factory :bank do
    association :user
    name 'test_bank'
    code 'test_bank_code'
  end

  factory :bank_account do
    association :bank
    association :currency
    association :user
    name 'test_bank_account_name'
    number 123
    iban 'test_iban'
  end

  factory :city do
    association :user
    association :country
    name 'test_city_name'
    postal_code '500 12' 
  end

  factory :city_part do
    association :user
    association :city
    name 'test_city_part_name'
    postal_code '500 11'
  end

  factory :country do
    association :user
    name 'test_country_name'
  end

  factory :currency do
    association :user
    name 'test_currency'
  end

  factory :day_entry do
    association :user
    association :task
    date '2016-01-02'
    start '13:00'
    stop '15:00'
    invoiced true
  end

  factory :exchange_rate do
    association :user
    association :bank
    association :currency
    rate '0.123'
    date '2016-09-08'
  end

  factory :house_number do
    association :user
    association :city
    association :street
    house_number 'test_house_number_house_number'
  end

  factory :income_report do
    association :user
    number '123'
    date '2016-02-03'
    to_pay '123'
    to_receive '321'
    note 'test_income_report_note'
  end
  
  factory :incomming_invoice do
    association :user
    association :incomming_invoice_sequence
    association :trade_subject
    association :currency
    association :exchange_rate
    number '123'
    generated_on_date '2016-03-04'
    taxable_supply_date '2016-04-05'
    due_date '2016-05-06'
    total_computed_base '123'
    total_computed_vat '234'
    total_corrected_base '345'
    total_corrected_vat '456'
    reverse_charge true
    paid true
    note 'test_incomming_invoice_note'
  end

  factory :incomming_invoice_item do
    association :user
    association :incomming_invoice
    association :item
    amount '123'
    note 'test_incomming_invoice_item_note'
  end

  factory :incomming_invoice_payment do
    association :user
    association :exchange_rate
    association :payment
    association :incomming_invoice
    amount '123'
  end

  factory :incomming_invoice_sequence do
    association :user
    name 'test_incomming_invoice_sequence_name'
    note 'test_incomming_invoice_sequence_note'
  end

  factory :item do
    association :user
    association :currency
    association :vat_charge
    association :trade_subject
    name 'test_item_name'
    note 'test_item_note'
    unit_price '123'
  end

  factory :outgoing_invoice do
    association :user
    association :outgoing_invoice_sequence
    association :trade_subject
    association :currency
    association :exchange_rate
    number '123'
    generated_on_date '2016-03-04'
    taxable_supply_date '2016-04-05'
    due_date '2016-05-06'
    total_computed_base '123'
    total_computed_vat '234'
    total_corrected_base '345'
    total_corrected_vat '456'
    reverse_charge true
    paid true
    note 'test_outgoing_invoice_note'
  end

  factory :outgoing_invoice_item do
    association :user
    association :outgoing_invoice
    association :item
    amount '123'
    note 'test_outgoing_invoice_item_note'
  end

  factory :outgoing_invoice_payment do
    association :user
    association :exchange_rate
    association :payment
    association :outgoing_invoice
    amount '123'
  end

  factory :outgoing_invoice_sequence do
    association :user
    name 'test_outgoing_invoice_sequence_name'
    note 'test_outgoing_invoice_sequence_note'
  end

  factory :payment do
    association :user
    association :payment_type
    association :currency
    association :bank_account
    association :trade_subject
    association :vat_report
    association :income_report
    date '2016-06-07'
    amount '123'
    note 'test_payment_note'
  end
    
  factory :payment_type do
    association :user
    name 'test_payment_type_name'
  end

  factory :project do
    association :user
    association :trade_subject
    name 'test_project_name'
    note 'test_project_note'
  end

  factory :province do
    association :user
    association :country
    name 'test_province_name'
  end

  factory :report_type do
    association :user
    name 'test_report_type_name'
  end

  factory :report do
    association :user
    association :report_type
    date '2016-07-08'
    to_pay '123'
    to_receive '321'
  end

  factory :street do
    association :user
    association :city
    name 'test_street_name'
  end

  factory :task do
    association :user
    association :project
    name 'test_task_name'
    link 'www.test_task_link.com'
    note 'test_task_note'
  end

  factory :task_type do
    association :user
    name 'test_task_type_name'
  end
  
  factory :trade_subject do
    association :user
    name 'test_trade_subject_name'
    identification_number '123'
    vat 'test_trade_subject_vat'
  end

  factory :vat_charge do
    association :user
    association :country
    percentage '123'
  end

  factory :vat_report do
    association :user
    number '123'
    date '2016-02-03'
    to_pay '123'
    to_receive '321'
    note 'test_vat_report_note'
  end

end