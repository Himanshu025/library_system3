require 'rails_helper'

RSpec.describe Library, type: :model do
  context 'validation' do
    it 'should have valid attributes' do
      library = build(:library)
      library.should be_valid
    end 
    it 'should not have empty name' do
      library = build(:library, name: '')
      library.should_not be_valid
    end
    it 'should not have name length less than 2' do
      library = build(:library, name: Faker::Number.number(1))
      library.should_not be_valid
    end
    it 'should not have empty address' do
      library = build(:library, address: '')
      library.should_not be_valid
    end
    it 'should not have address length less than 7' do
      library = build(:library, address: Faker::Number.number(2))
      library.should_not be_valid
    end
    it 'should not have empty phone number' do
      library = build(:library, phone: '')
      library.should_not be_valid
    end
    it 'should not have phone number length less than 5' do
      library = build(:library, phone: Faker::Number.number(2))
      library.should_not be_valid
    end
    it 'should not have phone number length more than 15' do
      library = build(:library, phone: Faker::Number.number(20))
      library.should_not be_valid
    end
  end

  context 'association' do
    it 'should have many books' do
      library = create(:library)
      book1 = create(:book, library_id: library.id)
      book2 = create(:book, library_id: library.id)
      library.books.includes(book1, book2).should be_truthy
    end
    it 'should have many members' do
      library = create(:library)
      member1 = create(:member, library_id: library.id)
      member2 = create(:member, library_id: library.id)
      library.members.includes(member1, member2).should be_truthy
    end
  end
end