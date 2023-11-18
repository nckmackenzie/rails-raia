if County.all.length == 0
    puts "Seeding counties...."
    County.create([{ name: 'Mombasa' },{ name: 'Kwale' },{ name: 'Kilifi' },{ name: 'Tana River' },{ name: 'Lamu' },
    { name: 'Taita-Taveta' },{ name: 'Garissa' },{ name: 'Wajir' },{ name: 'Mandera' },{ name: 'Marsabit' },
    { name: 'Isiolo' },{ name: 'Meru' },{ name: 'Tharaka-Nithi' },{ name: 'Embu' },{ name: 'Kitui' },
    { name: 'Machakos' },{ name: 'Makueni' },{ name: 'Nyandarua' },{ name: 'Nyeri' },{ name: 'Kirinyaga' },
    { name: 'Murang\'a' },{ name: 'Kiambu' },{ name: 'Turkana' },{ name: 'West Pokot' },{ name: 'Samburu' },
    { name: 'Trans-Nzoia' },{ name: 'Uasin Gishu' },{ name: 'Elgeyo-Marakwet' },{ name: 'Nandi' },
    { name: 'Baringo' },{ name: 'Laikipia' },{ name: 'Nakuru' },{ name: 'Narok' },{ name: 'Kajiado' },
    { name: 'Kericho' },{ name: 'Bomet' },{ name: 'Kakamega' },{ name: 'Vihiga' },{ name: 'Bungoma' },
    { name: 'Busia' },{ name: 'Siaya' },{ name: 'Kisumu' },{ name: 'Homa Bay' },{ name: 'Migori' },
    { name: 'Kisii' },{ name: 'Nyamira' },{ name: 'Nairobi' }])
    puts "Counties seeded!"
end

User.create(
    [
    {email: 'nicmackenzie@live.com',full_name: 'Nick Mackenzie',contact: '0724466628',
     county_id: 47,role: 1,elected_position: 'governor',profile_image:'https://i.pravatar.cc/48?u=9i98989',
     verified: 1,user_uid: 'bd453c6a-0f05-4e54-8919-1270855aff8d',username: 'nicmackenzie'},

    {email: 'jayden@raia.ke',full_name: 'Jayden',contact: '0723333333',
        county_id: 47,role: 1,elected_position: 'senator',profile_image:'https://i.pravatar.cc/48?u=0989777',
        verified: 1,user_uid: '453a79d8-086b-4fda-a667-924eb27055cb',username: 'jaysenetor'},
    
    {email: 'mellisa@example.com',full_name: 'Mellissa Chakara',gender: 'female',contact: '0734343434',
            county_id: 47,role: 1,elected_position: 'senator',profile_image:'https://i.pravatar.cc/48?u=9i9q21eqe',
            verified: 0,user_uid: '84c9f9a2-eeff-4076-bf5f-523b15119daa',username: 'melchakra'},
        
    ])