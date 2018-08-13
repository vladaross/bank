require 'yaml'
data = YAML.load_file('config/imported_data.yml')
data['users'].each do |user_id, user_data|
  user = User.create!(name: user_data['name'], password: user_data['password'])
  data['accounts']
  .select {|_, account_data| account_data['user_id'] == user_id }
  .each do |_, account_data|
    Account.create!(
      user_id: user.id,
      currency: account_data['currency'],
      amount: account_data['amount']
    )
  end
end
