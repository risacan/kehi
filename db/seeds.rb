companies = %w(
  shining
  raging
  risacan
)

shining = %w(一十木音也 四ノ宮那月 聖川真斗 一ノ瀬トキヤ 神宮寺レン 来栖翔 愛島セシル)
raging = %w(鳳瑛一 皇綺羅 帝ナギ 鳳瑛二 桐生院ヴァン 日向大和 天草シオン)
risacan = %w(risa can)

companies.each do |c|
  Company.create(name: c)
end

password = "password"
User.create(
  name: "risa",
  email: "risa.watanabe+test@smarthr.co.jp",
  password: password,
  encrypted_password: User.new(password: password).encrypted_password,
  company: Company.find_by(name: "risacan"),
  admin: true
)

risacan.each do |s|
  email = Faker::Internet.email
  user = User.create(
    name: s,
    email: email,
    password: password,
    encrypted_password: User.new(password: password).encrypted_password,
    company: Company.find_by(name: "risacan")
  )

  10.times do |n|
    Expense.create(
      title: ["出張代", "RubyKaigiのチケット代", "交際費"].sample,
      category: Expense.categories.values.sample,
      user: user
    )
  end
end

shining.each do |s|
  email = Faker::Internet.email
  user = User.create(
    name: s,
    email: email,
    password: password,
    encrypted_password: User.new(password: password).encrypted_password,
    company: Company.find_by(name: "shining")
  )

  10.times do |n|
    Expense.create(
      title: ["出張代", "RubyKaigiのチケット代", "交際費"].sample,
      category: Expense.categories.values.sample,
      user: user
    )
  end
end

raging.each do |s|
  email = Faker::Internet.email
  user = User.create(
    name: s,
    email: email,
    password: password,
    encrypted_password: User.new(password: password).encrypted_password,
    company: Company.find_by(name: "raging")
  )

  10.times do |n|
    Expense.create(
      title: ["出張代", "RubyKaigiのチケット代", "交際費"].sample,
      category: Expense.categories.values.sample,
      user: user
    )
  end
end
