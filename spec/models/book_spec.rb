require 'rails_helper'

RSpec.describe Book, type: :model do
  it '名前、説明がある場合、有効である'
  book = Book.new(name: 'テスト検査',description: 'テスト検査絵本の説明です。')
  expect(book)).to be_valid
  it '名前が無く説明がある場合、無効である'
  
  it '名前が無く説明がない場合、無効である'
  it '名前が有り説明がない場合、有効である'
end
