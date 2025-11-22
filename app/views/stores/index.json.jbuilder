json.data do
  json.items do
    json.array!(@stores) do |store|
      json.id store.id
      
      json.store_image store.image
      json.store_name store.store_name
      json.store_info store.store_info
      json.address store.address
      json.store_url store.store_url
      json.phone_number store.phone_number
      json.latitude store.latitude
      json.longitude store.longitude
    end  
  end
end