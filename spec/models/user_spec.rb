require 'rails_helper'

RSpec.describe User,type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
 it "is valid with a name, email, and password" do
   user = User.new(
      name: "Aaron",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
   )
   expect(user).to be_valid
 end
 # 名がなければ無効な状態であること
 it "is invalid without a name" do
   user = User.new(name: nil)
   user.valid?
   expect(user.errors[:name]).not_to include("can't be blank")
 end


 # メールアドレスがなければ無効な状態であること
 it "is invalid without an email address" do
   User.create(
     name:  "Joe",
      email:      "tester@example.com",
       password:   "dottle-nouveau-pavilion-tights-furze",
   )
   user = User.new(
     name:  "Jane",
     email:      "tester@example.com",
     password:   "dottle-nouveau-pavilion-tights-furze",
   )
   user.valid?
   expect(user.errors[:email]).to include("has already been taken")
 end
 # 重複したメールアドレスなら無効な状態であること
 it "is invalid with a duplicate email address"
 # ユーザーのフルネームを文字列として返すこと
 it "returns a user's full name as a string" do
   user = User.new(
     name: "John Doe",
     email:      "johndoe@example.com",
   )
   expect(user.name).to eq "John Doe"
 end
end

  # pending "add some examples to (or delete) #{__FILE__}"
