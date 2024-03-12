class GenerateDefaultUsers < ActiveRecord::Migration[7.1]
  def change
    User.create!(email: 'leo@gmail.com', password: 'password', password_confirmation: 'password', permissions: ['admin', ])

    User.create!(email: 'avaliador@gmail.com', password: 'password', password_confirmation: 'password', permissions: ['review'])

    User.create!(email: 'escritor@gmail.com', password: 'password', password_confirmation: 'password', permissions: ['create'])
  end
end
