require 'rails_helper'

RSpec.describe IssueHistory, type: :model do
  context 'validation' do
    it 'should have valid attributes' do
      issue_history = build(:issue_history)
      issue_history.should be_valid
    end
    it 'should not have empty issue type' do
      issue_history = build(:issue_history, issue_type: '')
      issue_history.should_not be_valid
    end

    it 'should not have empty issue date' do
      issue_history = build(:issue_history, issue_date: '')
      issue_history.should_not be_valid
    end

    it 'should not have invalid issue date' do
      issue_history = build(:issue_history, issue_date: Faker::Name.name)
      issue_history.should_not be_valid
    end

    it 'should not have invalid return date' do
      issue_history = build(:issue_history, return_date: Faker::Name.name)
      issue_history.should_not be_valid
    end

    it 'should not have empty member id' do
      issue_history = build(:issue_history, member_id: '')
      issue_history.should_not be_valid
    end

    it 'should not have empty book id' do
      issue_history = build(:issue_history, book_id: '')
      issue_history.should_not be_valid
    end

    it 'should not have invalid member id' do
      issue_history = build(:issue_history, member_id: Faker::Name.name)
      issue_history.should_not be_valid
    end

    it 'should not have invalid book id' do
      issue_history = build(:issue_history, book_id: Faker::Name.name)
      issue_history.should_not be_valid
    end
  end

  context 'association' do
    it 'should belong to member' do
      member = create(:member)
      issue_history = create(:issue_history, member_id: member.id)
      issue_history.member.should eq member
    end

    it 'should belong to book' do
      book = create(:book)
      issue_history = create(:issue_history, book_id: book.id)
      issue_history.book.should eq book
    end
  end
end