# frozen_string_literal: true

json.array! @blogposts, partial: 'blogposts/blogpost', as: :blogpost
