require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'タイトル、説明がある場合、有効である' do
    book = Book.new(title: 'テスト検査',description: 'テスト検査絵本の説明です')
    expect(book).to be_valid
  end
  it 'タイトルが無い場合、無効である' do
    book = Book.new(title: '', description: 'テスト検査絵本の説明です')
    book.save
    expect(book.errors[:title]).to include("を入力してください")
  end
  it 'タイトルが長すぎる場合、無効である' do
    long_titile = 'a' * 31
    book = Book.new(title: long_titile, description: 'テスト検査絵本の説明です')
    book.save
    expect(book.errors[:title]).to include("は30文字以内で入力してください")
  end
  it '説明が長すぎる場合、無効である' do
    long_description = 'a' * 141
    book = Book.new(title: 'テスト検査', description: long_description)
    book.save
    expect(book.errors[:description]).to include("は140文字以内で入力してください")
  end
end
