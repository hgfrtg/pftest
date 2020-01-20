class SearchController < ApplicationController

	def search
	@model = params["search"]["model"]
	@content = params["search"]["content"]
	@method = params["search"]["method"]
	@records = search_for(@model, @content, @method)
	end

	private
	def search_for(model, content, method)
	if model == 'user'
	  if method == 'perfect'
	    User.where(name: content)
	  elsif method == 'forward'
	    User.where('name LIKE ?', content+'%')
	  elsif method == 'backward'
	    User.where('name LIKE ?', '%'+content)
	  else
	    User.where('name LIKE ?', '%'+content+'%')
	  end
	elsif model == 'music'
	  if method == 'perfect'
	    Music.where(title: content)
	  elsif method == 'forward'
	    Music.where('title LIKE ?', content+'%')
	  elsif method == 'backward'
	    Music.where('title LIKE ?', '%'+content)
	  else
	    Music.where('title LIKE ?', '%'+content+'%')
	  end
	end
	end
end
