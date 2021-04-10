Rails.application.routes.draw do

root to: 'homes#index'

get 'homes/index'
get 'homes/episodes'
get 'homes/quotes'
get 'breaking_bad/seasons/:id', to: 'homes#breaking_bad_seasons', as: 'breaking_bad_season'
get 'better_call_saul/seasons/:id', to: 'homes#better_call_saul_seasons', as: 'better_call_saul_season'

get 'breaking_bad/episodes', to: 'homes#breaking_bad_episodes', as: 'breaking_bad_episode'
get 'better_call_saul/episodes', to: 'homes#better_call_saul_episodes', as: 'better_call_saul_episode'

get 'characters', to: 'homes#characters', as:'character'

post 'search_characters', to: 'homes#search_characters', as:'search_character'

get 'view_characters', to: 'homes#view_characters', as:'view_character'
end
