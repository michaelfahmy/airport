ActiveAdmin.register User do
  permit_params :first_name, :last_name, :role, :time_zone, :email, :password, :password_confirmation

  scope :all
  scope :manager
  scope :consumer

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

  filter :email_contains
  filter :first_name_contains
  filter :last_name_contains

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :role, as: :select, collection: User.roles.keys.map { |r| [r.humanize, r] }
      f.input :time_zone
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
