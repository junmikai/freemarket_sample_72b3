# require 'rails_helper'

# describe Product do
#   describe '#create' do

#   it "nikcnameがない場合は登録できないこと" do
#     user = build(:user, nickname: "")
#     user.valid?
#     expect(user.errors[:nickname]).to include("can't be blank")
#   end


#     it "nameがない場合は登録できないこと" do
#       user = build(:product, name: "")
#       user.valid?
#       expect(user.errors[:name]).to include("を入力してください")
#     end

#     it "descriptionがない場合は登録できないこと" do
#       user = build(:product, description: "")
#       user.valid?
#       expect(user.errors[:description]).to include("を入力してください")
#     end

#     it "priceがない場合は登録できない事" do
#       user = build(:product, price: "")
#       user.valid?
#       expect(user.errors[:price]).to include("を入力してください")
#     end


#   end
# end