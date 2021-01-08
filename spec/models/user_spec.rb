require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = build(:user)
    end

    context 'ユーザー登録が正常に完了する時' do
      it '全ての情報が正しく入力されていれば登録できること' do
        expect(@user).to be_valid
      end
      it 'Eメールに@が含まれていれば登録できること' do
        @user.email = 'aaa@123'
        expect(@user).to be_valid
      end
      it 'パスワードが半角英数混合8文字以上であれば登録できること' do
        @user.password = 'aaaa1234'
        @user.password_confirmation = 'aaaa1234'
        expect(@user).to be_valid
      end
      it '名前が全角であれば登録できること' do
        @user.last_name = '山田'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザー登録が正常に完了しない時' do
      it 'ニックネームが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'Eメールが空だと登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'Eメールに@が含まれていないと登録できないこと' do
        @user.email = 'aaa123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '同じEメールは登録できないこと' do
        another_user = create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'パスワードが空だと登録できないこと' do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが八文字以上でないと登録できないこと' do
        @user.password = 'aaaa123'
        @user.password_confirmation = 'aaaa123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字どちらも含む8文字以上で入力してください')
      end
      it 'パスワードが英数混合でないと登録できないこと' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字どちらも含む8文字以上で入力してください')
      end
      it 'パスワードと確認用パスワードが一致していないと登録できないこと' do
        @user.password = 'aaaa1234'
        @user.password_confirmation = 'bbbb1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it '名前が空だと登録できないこと' do
        @user.last_name = nil
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください", "名前を入力してください")
      end
      it '名前が全角でないと登録できないこと' do
        @user.last_name = 'Pitt'
        @user.first_name = 'Brad'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は全角で入力してください", "名前は全角で入力してください")
      end

      it 'ユーザータイプが選択されていないと登録できないこと' do
        @user.type_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザータイプを選択してください')
      end

      it '生年月日が空だと登録できないこと' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
