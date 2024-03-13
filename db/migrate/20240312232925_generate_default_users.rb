class GenerateDefaultUsers < ActiveRecord::Migration[7.1]
  def change
    User.create!(email: 'leo@gmail.com', name: 'Leonardo', password: 'password', password_confirmation: 'password', permissions: ['admin', ])

    User.create!(email: 'avaliador@gmail.com', name: 'Cleiton', password: 'password', password_confirmation: 'password', permissions: ['review'])

    User.create!(email: 'escritor@gmail.com', name: 'Jorge', password: 'password', password_confirmation: 'password', permissions: ['create'])
  end
end
