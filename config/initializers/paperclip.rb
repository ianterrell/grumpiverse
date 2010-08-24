PaperclipStorageHash = {
  # :storage => :s3,
  # :s3_credentials => "#{Rails.root}/config/s3.yml",
  # :path => ":attachment/:id/:style/:basename.:extension",
  # :bucket => Rails.application.config.s3_bucket
  
  :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
  :url => "/system/:class/:attachment/:id/:style/:filename"
}