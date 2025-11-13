json.data do
  json.items do
    json.array!(@stores) do |store|
      json.id store.id
      json.store_image url_for(store.store_image)
      json.store_name store.store_name
      json.caption store.store_info
      json.address store.address
      json.latitude store.latitude
      json.longitude store.longitude
    end  
  end
end