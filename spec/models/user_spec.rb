require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規会員登録' do
    context '新規会員登録がうまくいくとき' do
      it 'nickname、email、名前（first_name）、名前（last_name）、名前（first_name_kana）、名前（last_name_kana）、誕生日、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '000abe'
        @user.password_confirmation = '000abe'
        expect(@user).to be_valid
      end
    end

    context '新規会員登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がない場合は登録できない' do
        @user.email = 'aaaaaaaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is must NOT contain any other characters than alphanumerics.')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is must NOT contain any other characters than alphanumerics.')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '0123bbbaa'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation can't be blank")
      end
      it '名前（first_name_kana）にカタカナ以外があれば登録できない' do
      end
      it '名前（last_name_kana）にカタカナ以外があれば登録できない' do
      end
    end
  end
end
