# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# ユーザーのデータを作成
users = [
  { name: 'あんな', email: 'anna@gmail.com', password: '11111111', password_confirmation: '11111111' },
  { name: 'ひとし', email: 'hitoshi@gmail.com', password: '22222222', password_confirmation: '22222222' }
]

users.each do |user|
  User.create(user)
end

# クイズのデータを作成
questions = [
  {
    content: '「いぬ」はどちらですか??',
    correct_image: 'correct_image1.jpg',
    incorrect_image: 'incorrect_image1.jpg',
    correct_choice: '選択肢1'
  },
  {
    content: '「ちょうちょ」はどちらですか??',
    correct_image: 'correct_image2.jpg',
    incorrect_image: 'incorrect_image2.jpg',
    correct_choice: '選択肢1'
  },
  {
    content: '「かさ」はどちらですか??',
    correct_image: 'correct_image3.jpg',
    incorrect_image: 'incorrect_image3.jpg',
    correct_choice: '選択肢1'
  },
  {
    content: '「しょうぼうしゃ」はどちらですか??',
    correct_image: 'correct_image4.jpg',
    incorrect_image: 'incorrect_image4.jpg',
    correct_choice: '選択肢1'
  },
  {
    content: '「まる」はどちらですか??',
    correct_image: 'correct_image5.png',
    incorrect_image: 'incorrect_image5.png',
    correct_choice: '選択肢1'
  },
  {
    content: '「さんかく」はどちらですか??',
    correct_image: 'correct_image6.png',
    incorrect_image: 'incorrect_image6.png',
    correct_choice: '選択肢1'
  },
  {
    content: '「しかく」はどちらですか??',
    correct_image: 'correct_image7.png',
    incorrect_image: 'incorrect_image7.png',
    correct_choice: '選択肢1'
  },
  {
    content: 'どちらが大きいですか??',
    correct_image: 'correct_image8.png',
    incorrect_image: 'incorrect_image8.png',
    correct_choice: '選択肢1'
  },
  {
    content: 'どちらが小さいですか??',
    correct_image: 'correct_image9.png',
    incorrect_image: 'incorrect_image9.png',
    correct_choice: '選択肢1'
  },
  {
    content: 'どちらが多いですか??',
    correct_image: 'correct_image10.png',
    incorrect_image: 'incorrect_image10.png',
    correct_choice: '選択肢1'
  }
]

questions.each do |question|
  Question.create(question)
end
