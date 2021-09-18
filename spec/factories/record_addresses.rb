FactoryBot.define do
  factory :record_address do
    postal_code           { '123-4567' }
    area_id               { '34' }
    municipalities        { '室蘭市' }
    house_number          { '田町1丁目'}
    building              { 'ハニーパーク101号室' }
    tel                   { '09012345678' } 
    token                 { 'pbk-16847590' }
  end
end
