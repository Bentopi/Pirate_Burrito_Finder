json.photos @photos do |p|
  json.id p.id
  json.treasuremap_id p.treasuremap_id
  json.location p.location
  json.latitude p.latitude
  json.longitude p.longitude
  json.descritpion p.description
end
