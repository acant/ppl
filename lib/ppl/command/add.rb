
class Ppl::Command::Add < Ppl::Application::Command

  attr_writer :name_service

  name        "add"
  description "Add a new contact"

  def options(parser, options)
    parser.banner = "usage: ppl add <contact> <name>"
  end

  def execute(input, output)
    contact_id   = input.arguments.shift.dup
    contact_name = input.arguments.shift.dup

    if contact_id.nil?
      raise Ppl::Error::IncorrectUsage, "No contact specified"
    end

    if contact_name.nil?
      raise Ppl::Error::IncorrectUsage, "No name specified"
    end

    contact = Ppl::Entity::Contact.new
    contact.id = contact_id
    contact.name = @name_service.parse contact_name

    @storage.save_contact(contact)
    return true
  end

end

