helpers do

  def form_action(contact)
    if contact.persisted?
      "/contacts/#{contact.id}"
    else
      "/contacts"
    end
  end

  def hidden_http_method(contact)
    if contact.persisted?
      '<input type="hidden" name="_method" value="PUT">'
    end
  end

  def submit_text(contact)
    if contact.persisted?
      "Edit"
    else
      "Create"
    end
  end

end