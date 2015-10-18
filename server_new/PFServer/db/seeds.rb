# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Emotion.create(emotion_name: 'Curiosity',artwork_id: 1)
Emotion.create(emotion_name: 'Repulsion',artwork_id: 2)
Emotion.create(emotion_name: 'Love',artwork_id: 3)
Emotion.create(emotion_name: 'Perplexity',artwork_id: 4)
Emotion.create(emotion_name: 'Power',artwork_id: 5)
Emotion.create(emotion_name: 'Sex',artwork_id: 6)
Emotion.create(emotion_name: 'Perspective',artwork_id: 7)
Emotion.create(emotion_name: 'Anger',artwork_id: 1)
Emotion.create(emotion_name: 'Time',artwork_id: 2)
Emotion.create(emotion_name: 'Sadness',artwork_id: 3)
Emotion.create(emotion_name: 'Hope',artwork_id: 4)

#:name, :description, :artwork_longtitude, :artwork_latitude, :title, :image_url, :ibeaconuuid
Artwork.create(name:'Bush Col du Galibier',description:'Bush Col du Galibier',artwork_longtitude:1,artwork_latitude:1,
               title:'Bush Col du Galibier',image_url:'Bush_Col_du_Galibier_1.jpg',ibeaconuuid:1)
Artwork.create(name:'Bush Gravenhurst',description:'Bush Gravenhurst',artwork_longtitude:2,artwork_latitude: 2,
               title:'Bush Gravenhurst',image_url:"Bush_Gravenhurst_1.jpg",ibeaconuuid:2 )
Artwork.create(name:'Bush Ingleby',description:'Bush Ingleby',artwork_longtitude:3,artwork_latitude: 3,
               title:'Bush Ingleby',image_url:"Bush_Ingleby_1.jpg",ibeaconuuid:3 )
Artwork.create(name:'Bush Light in the valley',description:'Bush Light in the valley',artwork_longtitude:4,artwork_latitude:4,
               title:'Bush Light in the valley',image_url:"Bush_Light_in_the_valley_1.jpg",ibeaconuuid: 4)
Artwork.create(name:'Bush My name is the great went',description:'Bush My name is the great went',artwork_longtitude:5,artwork_latitude: 5,
               title:'Bush My name is the great went',image_url:"Bush_My_name_is_the_great_went_1.jpg",ibeaconuuid: 5)
Artwork.create(name:'Bush The recliners were only the beginning',description:'Bush The recliners were only the beginning',artwork_longtitude:6,artwork_latitude: 6,
               title:'Bush The recliners were only the beginning',image_url:"Bush_The_recliners_were_only_the_beginning_4.jpg",ibeaconuuid: 6)
Artwork.create(name:'Bush Type cast',description:'Bush Type cast',artwork_longtitude:7,artwork_latitude: 7,
               title:'Bush Type cast',image_url:"Bush_Type_cast_2.jpg",ibeaconuuid: 7)

Artwork.create(name:'Beasley Old Wilson Hall',description:'Beasley Old Wilson Hall',artwork_longtitude:8,artwork_latitude: 8,
               title:'Beasley Old Wilson Hall',image_url:"Beasley_Old_Wilson_Hall.png",ibeaconuuid: 8)

Artwork.create(name:'Beasley Microbiology',description:'Beasley Microbiology',artwork_longtitude:9,artwork_latitude: 9,
               title:'Beasley Microbiology',image_url:"Beasley_Microbiology.png",ibeaconuuid: 9)

Artwork.create(name:'Beasley Internal courtyard Biochemistry',description:'Beasley Internal courtyard Biochemistry',artwork_longtitude:10,artwork_latitude:10 ,
               title:'Beasley Internal courtyard Biochemistry',image_url:"Beasley_Internal_courtyard_Biochemistry.png",ibeaconuuid:10 )
Artwork.create(name:'Beasley Union House',description:'Beasley Union House',artwork_longtitude:11,artwork_latitude:11 ,
               title:'Beasley Union House',image_url:"Beasley_Union_House.png",ibeaconuuid: 11)
Artwork.create(name:'Beasley Sports Oval',description:'Beasley Sports Oval',artwork_longtitude:12,artwork_latitude:12 ,
               title:'Beasley Sports Oval',image_url:"Beasley_Sports_Oval_1.png",ibeaconuuid: 12)
Artwork.create(name:'Tipoti Solal mawa',description:'Tipoti Solal mawa',artwork_longtitude:13,artwork_latitude:13 ,
               title:'Tipoti Solal mawa',image_url:"Tipoti_Solal_mawa_1.png",ibeaconuuid: 13)
Artwork.create(name:'Scaria Land faded',description:'Scaria Land faded',artwork_longtitude:14,artwork_latitude:14 ,
               title:'Scaria Land faded',image_url:"Scaria_Land_faded_1.png",ibeaconuuid: 14)
Artwork.create(name:'Scaria Camel and the needle',description:'Scaria Camel and the needle',artwork_longtitude:15,artwork_latitude:15 ,
               title:'Scaria Camel and the needle',image_url:"Scaria_Camel_and_the_needle_1.png",ibeaconuuid: 15)
Artwork.create(name:'Baker Kalaya Tjukurpa',description:'Baker Kalaya Tjukurpa',artwork_longtitude:16,artwork_latitude:16 ,
               title:'Baker Kalaya Tjukurpa',image_url:"Baker_Kalaya_Tjukurpa_1.png",ibeaconuuid: 16)

Comment.create(user_id:1, artwork_id:1, comment:"Great!")
Comment.create(user_id:1, artwork_id:2, comment:"Hi!")
Comment.create(user_id:1, artwork_id:3, comment:"Brilientant!")
Comment.create(user_id:1, artwork_id:4, comment:"Comemnt is annoying!")
Comment.create(user_id:1, artwork_id:5, comment:"What I say!")
Comment.create(user_id:1, artwork_id:5, comment:"HEHE!")
Comment.create(user_id:1, artwork_id:6, comment:"What is this!")

User.create(user_email: "s@s.com")