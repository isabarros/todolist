class ListDecorator < Draper::Decorator
  delegate_all

  	def public_toggle_name
  		object.public? ? "Ocultar" : "Publicar"
  	end

  	def public_toggle_path
  		debugger
  		object.public? ? unpublish_list_path(object) : publish_list_path(object)
  	end
end
