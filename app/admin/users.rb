ActiveAdmin.register User do
  permit_params :first_name, :last_name, :role, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :role
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :role, as: :select, collection: User.roles.keys.map { |r| [r.humanize, r] }
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
