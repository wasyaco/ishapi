
FactoryBot.define do

  factory :city do
    name 'City'
    cityname 'city'
    name_ru 'city'
    name_pt 'city'
    name_en 'city'
  end

  factory :gallery do
    name 'xxTestxx'
    after :build do |g|
      g.site ||= Site.new( :domain => 'xxDomainxx', :lang => 'xxLangxx' )
    end
  end

  factory :order_item, :class => CoTailors::OrderItem do
    kind CoTailors::OrderItem::KIND_PANTS
    fabric :white
    quantity 1
    cost 199
    after :build do |i|
      i.measurement = CoTailors::ProfileMeasurement.new
      i.order = CoTailors::Order.all.first
    end
  end

  factory :photo do
  end

  factory :report do
    name 'blahblah'
    after :build do |f|
      ph = Photo.create :photo => File.open( Rails.root.join( 'data', 'photo.png' ) )
      f.photo = ph
      f.save
    end
  end
 
  factory :site do
  end

  factory :tag do
    name 'tag-name'
    name_seo 'tagname-seo'
  end

  factory :user do
    email 'test@gmail.com'
    password '12345678'

    factory :manager do
      email 'manager@gmail.com'
    end

    factory :piousbox do
      email 'piousbox@gmail.com'
    end
  end

end
