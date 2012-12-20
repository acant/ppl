
class Ppl::Format::AddressBook::MuttQuery < Ppl::Format::AddressBook

  attr_writer :table

  def initialize
    @table = Ppl::Format::Table.new([:email, :name])
  end

  def process(address_book)
    address_book.each { |contact| add_row(contact) }
    @table.to_s
  end


  private

  def add_row(contact)
    name = nil
    if !contact.name.nil?
      name = contact.name
    end

    @table.add_row({
      :email => contact.email_address,
      :name  => name,
    })
  end


end
