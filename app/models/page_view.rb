class PageView < Impression
  scope :for_type, -> (type) do
    where(impressionable_type: type)
  end
end