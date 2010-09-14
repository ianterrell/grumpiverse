class Cache
  def self.nuke!
    FileUtils.rm_rf File.join(Rails.root, 'public', 'cache')
  end
end