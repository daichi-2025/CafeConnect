# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# デプロイを学ぼう 7章【テストデータを理解しよう】 参照

Daichi = User.find_or_create_by!(email: "daichi@example.com") do |user|
  user.name = "daichi"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

Kouki = User.find_or_create_by!(email: "kouki@example.com") do |user|
  user.name = "Kouki"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

Yumiko = User.find_or_create_by!(email: "yumiko@example.com") do |user|
  user.name = "Yumiko"
  user.password = "password"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

DMM Cafe = Store.find_or_create_by!(email: "dmm_cafe@example.com") do |store|
  store.store_name = "DMM Cafe"
  store.password = "password"
  store.store_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-store1.jpg"), filename:"sample-store1.jpg")
  store.phone_number = 00000000000
  store.address = "東京都葛飾区〇〇 〇〇ー〇〇ー〇〇"
  store.store_url = "dmm_cafe.com"
  store.store_info = "東京都墨田区の下町にあるおしゃれなカフェです。店内からはスカイツリーを見ることもできます。30席ある広々とした店内で季節のコーヒーや、オリジナルのケーキをどうぞお楽しみください。"
end

ABC Cafe = Store.find_or_create_by!(email: "abc_cafe@example.com") do |store|
  store.store_name = "ABC Cafe"
  store.password = "password"
  store.store_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-store2.jpg"), filename:"sample-store2.jpg")
  store.phone_number = "11111111111"
  store.address = "東京都墨田区〇〇 〇〇ー〇〇ー〇〇"
  store.store_url = "abc_cafe.com"
  store.store_info = "東京都葛飾区の駅近にあるカフェです。アメリカンダイニングをモチーフにした店内でコーヒーやハンバーガーを召し上がっていただけます。イングリッシュメニューもありますので、海外の方にも人気です。"
end

Tokyo Cafe = Store.find_or_create_by!(email: "tokyo_cafe@example.com") do |store|
  store.store_name = "Tokyo Cafe"
  store.password = "password"
  store.store_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-store3.jpg"), filename:"sample-store3.jpg")
  store.phone_number = "22222222222"
  store.address = "東京都港区〇〇 〇〇ー〇〇ー〇〇"
  store.store_url = "tokyo_cafe.com"
  store.store_info = "日差しが差し込む開放的な店内で洗練されたコーヒーをお楽しみいただけます。店舗オリジナル焙煎のコーヒーを使ったラテが大変人気です。"
end

Post.find_or_create_by!(title: "新メニューが始まります！マスカルポーネを作って使ったチーズケーキです！") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.caption = "来週から、チーズケーキの提供を始めます！ マスカルポーネを使った自信作です⭐️"
  post.store = DMM Cafe
  post.category = "ケーキ"
  post.remember_created_at = DateTime.new(2025,10,20) 
end

Post.find_or_create_by!(title: "ハロウィン限定のパンプキンラテを提供します！") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.caption = "ハロウィン限定のドリンクでパンプキンラテを提供します。シナモンとナツメグのスパイス感にパンプキンのソースを追加した特別なラテです。どうぞお試しください！ ハッピーハロウィン！"
  post.store = DMM Cafe
  post.category = "コーヒー"
  post.remember_created_at = DateTime.new(2025,10,27) 
end

Post.find_or_create_by!(title: "コーヒー豆10%オフ!") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.caption = "本日から1週間、店のコーヒー豆10%オフセールです！ 貴重なエチオピアのコーヒーや店舗のオリジナルブレンドもいつもよりお得にご購入ができます。 気になるお豆は、テイスティングも時間があれば行いますので、ぜひ足を運んでくださいね。"
  post.store = ABC Cafe
  post.category = "コーヒー"
  post.remember_created_at = DateTime.new(2025,11,1) 
end

Post.find_or_create_by!(title: "忘れ物") do |post|
  post.caption = "本日10時から11時ごろに来店されたお客様で赤い傘をお忘れになった方はいませんでしょうか、で保管しておりますので、ご一報くださればと思います。よろしくお願いします。"
  post.store = ABC Cafe
  post.category = "その他"
  post.remember_created_at = DateTime.new(2025,11,5) 
end