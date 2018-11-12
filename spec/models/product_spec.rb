require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { described_class.new }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      @category = Category.new
      subject.category = @category
      subject.name = "Monkey Spacesuit"
      subject.price = 1000000
      subject.quantity = 3
      expect(subject).to be_valid
    end
    it 'is not valid without a name' do
      @category = Category.new
      subject.category = @category
      subject.name = nil
      subject.price = 1000000
      subject.quantity = 3
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end
    it 'is not valid without a price' do
      @category = Category.new
      subject.category = @category
      subject.name = "Monkey Spacesuit"
      subject.price = nil
      subject.quantity = 3
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end
    it 'is not valid without a quantity' do
      @category = Category.new
      subject.category = @category
      subject.name = "Monkey Spacesuit"
      subject.price = 1000000
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'is not valid without a category' do
      subject.category = nil
      subject.name = "Monkey Spacesuit"
      subject.price = 1000000
      subject.quantity = 3
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end
  end
end