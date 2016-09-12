require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { User.new }
  
  describe "Associations" do
    it { should have_many(:address_links) }
    it { should have_many(:address_types) }
    it { should have_many(:bank_accounts) }
    it { should have_many(:banks) }
    it { should have_many(:cities) }
    it { should have_many(:city_parts) }
    it { should have_many(:countries) }
    it { should have_many(:currencies) }
    it { should have_many(:day_entries) }
    it { should have_many(:exchange_rates) }
    it { should have_many(:house_numbers) }
    it { should have_many(:income_reports) }
    it { should have_many(:incomming_invoice_items) }
    it { should have_many(:incomming_invoice_payments) }
    it { should have_many(:incomming_invoices) }
    it { should have_many(:incomming_invoice_sequences) }
    it { should have_many(:items) }
    it { should have_many(:outgoing_invoice_items) }
    it { should have_many(:outgoing_invoice_payments) }
    it { should have_many(:outgoing_invoices) }
    it { should have_many(:outgoing_invoice_sequences) }
    it { should have_many(:payment_types) }
    it { should have_many(:payments) }
    it { should have_many(:projects) }
    it { should have_many(:provinces) }
    it { should have_many(:report_types) }
    it { should have_many(:reports) }
    it { should have_many(:streets) }
    it { should have_many(:task_types) }
    it { should have_many(:tasks) }
    it { should have_many(:trade_subjects) }
    it { should have_many(:vat_charges) }
    it { should have_many(:vat_reports) }
  end

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:trade_subject) }
    it { should validate_presence_of(:identification_number) }
    it { should validate_presence_of(:house_number) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:country) }  
  end

end
