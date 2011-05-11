class Link < ActiveRecord::Base
  set_primary_key 'identifier'
  before_create :generate_identifier
  attr_accessor :custom

  belongs_to :url
  validates_presence_of :url

  has_many :visits

  def self.shorten(address, custom = nil)
    url = Url.where(:original => address).first
    return link = url.links.first if url
    transaction do
      url = Url.create(:original => address)
      options = { :url => url }
      begin
        custom and Link.find(custom)
      rescue ActiveRecord::RecordNotFound => e
        options.merge!( :custom => custom )
      end
      link = Link.create(options)
    end
    link
  end

  private

  def generate_identifier
    raise "must have associated url" if (url.nil? || url.new_record?)
    self.id = custom || url.id.to_s(36) 
  end
end
