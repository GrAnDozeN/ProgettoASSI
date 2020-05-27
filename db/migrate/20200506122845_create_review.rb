class CreateReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.integer 'musicman'
    	t.text 'comments'
    	t.references 'user'
    	t.references 'music'
    end
  end
end
