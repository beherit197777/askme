class UpdateQuestionsTable < ActiveRecord::Migration[6.1]
  def change
    # Изменяем тип столбца 'body' на 'text'
    rename_column :questions, :body, :text
    change_column :questions, :text, :string

    # Добавляем столбец 'author_id'
    add_column :questions, :author_id, :integer

    # Добавляем индексы для 'author_id' и 'user_id'
    add_index :questions, :author_id
    add_index :questions, :user_id

    # Удаляем точность для полей created_at и updated_at
    change_column :questions, :created_at, :datetime, precision: nil
    change_column :questions, :updated_at, :datetime, precision: nil
  end
end
