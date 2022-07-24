require 'rails_helper'

RSpec.describe 'コメント', type: :system do
  let(:me) { create(:user) }
  let(:board) { create(:board) }
  let(:comment_by_me) { create(:comment, user: me, board: board) }
  let(:comment_by_others) { create(:comment, board: board) }

  describe 'コメントのCRUD' do
    before do
      comment_by_me
      comment_by_others
    end
    describe 'コメントの一覧' do
      it 'コメントの一覧が表示されること' do
        login_as_user me
        visit board_path board
        within('#js-table-comment') do
          expect(page).to have_content(comment_by_me.body)
          expect(page).to have_content(comment_by_me.user.decorate.full_name)
        end
      end
    end

    describe 'コメントの作成' do
      it 'コメントを作成できること', js: true do
        login_as_user me
        visit board_path board
        fill_in 'コメント', with: '新規コメント'
        click_on '投稿'
        comment = Comment.last
        within("#comment-#{comment.id}") do
          expect(page).to have_content(me.decorate.full_name)
          expect(page).to have_content('新規コメント')
        end
      end
      it 'コメントの作成に失敗すること', js: true do
        login_as_user me
        visit board_path board
        fill_in 'コメント', with: ''
        click_on '投稿'
        expect(page).to have_content('コメントを作成できませんでした')
      end
    end

    describe 'コメントの編集' do
      context '他人のコメントの場合' do
        it '編集ボタン・削除ボタンが表示されないこと' do
          login_as_user me
          visit board_path board
          within("#comment-#{comment_by_others.id}") do
            expect(page).not_to have_selector('.js-edit-comment-button')
            expect(page).not_to have_selector('.js-delete-comment-button')
          end
        end
      end
    end
  end
end