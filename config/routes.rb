Rails.application.routes.draw do
  get 'comments/index', as: "comments"
  post 'comments/add', as: "comments_add"
  get 'comments/remove', as: "comments_remove"
  get 'comments/update', as: "comments_update"
  
  get 'likes/index'
  post 'likes/add', as: "likes_add"
  post 'likes/remove', as: "likes_remove"
  get 'likes/update'
  get 'photos', to:"photos#index",as:"photos"
  get 'photos/view/:id', to:"photos#view",as:"photos_view"
  post 'photos/add', to:"photos#add",as:"photos_add"
  get 'photos/edit/:id', to:"photos#edit",as:"photos_edit"
  get 'photos/remove/:id', to:"photos#remove",as:"photos_remove"
  get 'photos/update/:id', to:"photos#update",as:"photos_update"
  get 'photos/delete/:id', to:"photos#delete",as:"photos_delete"

  post 'followers', as:"user_follow",to:"followers#add"
  post 'followers/:name',to:"followers#add"
  post 'followers/accept/:id',to:"followers#accept", as:"follow_accept"
  post 'followers/deny/:id',to:"followers#deny", as:"follow_deny"
  post 'followers/remove/:id',to:"followers#remove",as:"follow_remove"
  post 'followers/removefall/:id',to:"followers#removefall",as:"unfollow"
  get 'users', to:"users#index"
  
  get 'users/view/:name', to:"users#view",as:"view_users"

  get 'users/new', as:"new_users"
  post 'users/create', as:"create_users"
  get 'users/edit', as:"edit_users"
  get 'users/update', as:"update_users"
  get 'users/delete', as:"delete_users"
  get 'users/login', as:"login_users",to:"users#login"
  post 'users/logged', as:"login_user",to:"users#logged"
  delete 'users/logout', as:"logout_users",to:"users#logout"
  root to:"users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
