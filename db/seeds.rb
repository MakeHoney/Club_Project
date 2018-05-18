# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create([{name: "연행예술"}, {name:"학술언론"},{name:"레져스포츠"},{name:"체육"},{name:"과학기술"},{name:"사회활동종교"},{name:"창작전시"}]);

admin_user1 = User.create( email: "sangah@naver.com" , name: "동아리1", club_id: 1, author: 2, password: "asdfgh" )
user = User.find(1)
 
admin_user2 = User.create( email: "parksangah1@naver.com" , name: "관리자1" , author: 1, password: "asdfgh" )
user = User.find(2)
user.add_role :admin


Club.create([
        { 
            name: "고전기타반" ,
            short_desc: "we are club1",
            detail_desc: "this is club2",
            meeting_date: "every sunday",
            contact: "010-2222-2222",
            room_location: "room#24",
            isApply: 2,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "GLEE" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 2,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "녹두벌" ,
            short_desc: "we are club3",
            detail_desc: "this is club3",
            meeting_date: "everyday",
            contact: "010-2222-2222",
            room_location: "room#44",
            isApply: 2,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "미디올로지" ,
            short_desc: "we are club4",
            detail_desc: "this is club4",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#04",
            isApply: 0,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "스파이더스" ,
            short_desc: "we are club5",
            detail_desc: "this is club5",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "아몽극회" ,
            short_desc: "we are club6",
            detail_desc: "this is club6",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "5분쉼표" ,
            short_desc: "we are club7",
            detail_desc: "this is club7",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "Beat" ,
            short_desc: "we are club8",
            detail_desc: "this is club8",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "Conjurer" ,
            short_desc: "we are club9",
            detail_desc: "this is club9",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "Soul" ,
            short_desc: "we are club10",
            detail_desc: "this is club10",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 1,
            applyMethod: "google docs"
        },
        { 
             name: "검도부" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "꽁" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "아주도" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "차오름" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "호완" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "2.5g" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "ABBA" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "ABC" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "AFC" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "ATC" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "BUT" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 2,
            applyMethod: "google docs"
        },
        { 
             name: "새봄" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 2,
            applyMethod: "google docs"
        },
        { 
             name: "시사문제강독회" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 2,
            applyMethod: "google docs"
        },
        { 
             name: "역사문제연구회" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 2,
            applyMethod: "google docs"
        },
        { 
             name: "TIME" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 2,
            applyMethod: "google docs"
        },
        { 
             name: "PLUS" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 2,
            applyMethod: "google docs"
        },
        { 
             name: "Ajess" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 2,
            applyMethod: "google docs"
        },
        { 
             name: "ANC" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 2,
            applyMethod: "google docs"
        },
        { 
             name: "S.F.C" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 5,
            applyMethod: "google docs"
        },
        { 
             name: "아가셍" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 5,
            applyMethod: "google docs"
        },
        { 
             name: "CCC" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 5,
            applyMethod: "google docs"
        },
        { 
             name: "CMI" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 5,
            applyMethod: "google docs"
        },
        { 
             name: "고슴도치" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 6,
            applyMethod: "google docs"
        },
        { 
             name: "A.SA." ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 6,
            applyMethod: "google docs"
        },
        { 
             name: "소금꽃" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 6,
            applyMethod: "google docs"
        },
        { 
             name: "아리랑영화패" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 6,
            applyMethod: "google docs"
        },
        { 
             name: "아묵회" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 6,
            applyMethod: "google docs"
        },
        { 
             name: "아미" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 6,
            applyMethod: "google docs"
        },
        { 
             name: "AD-Brain" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 6,
            applyMethod: "google docs"
        },
        { 
             name: "돌벗" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 3,
            applyMethod: "google docs"
        },
        { 
             name: "무한공간" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 3,
            applyMethod: "google docs"
        },
        { 
             name: "산악부" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 3,
            applyMethod: "google docs"
        },
        { 
             name: "용트림" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 3,
            applyMethod: "google docs"
        },
        { 
             name: "유스호스텔" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 3,
            applyMethod: "google docs"
        },
        { 
             name: "A-pin" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 3,
            applyMethod: "google docs"
        },
        { 
             name: "Drop-in" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 3,
            applyMethod: "google docs"
        },
        { 
             name: "아미콤" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "아톰" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "유레카" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        },
        { 
             name: "COB.E" ,
            short_desc: "we are club2",
            detail_desc: "this is club2",
            meeting_date: "every monday",
            contact: "010-2222-2222",
            room_location: "room#30",
            isApply: 0,
            category_id: 4,
            applyMethod: "google docs"
        }
    ]);
Photo.create([
        {
            url: "http://www.visualdive.com/wp-content/uploads/2017/12/5-4.jpg",
            isMain: 0,
            club_id: 1
        },
        {
            url: "https://upload.wikimedia.org/wikipedia/ko/c/c3/%EB%82%B4_%EC%9D%B4%EB%A6%84%EC%9D%80_%EC%B9%B8_%EC%98%81%ED%99%94_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg",
            isMain: 0,
            club_id: 2
        },
        {
            url: "http://www.obaltan.net/bbs/data/poster/sweetlife2345.jpg",
            isMain: 0,
            club_id: 3
        },{
            url: "http://www.obaltan.net/bbs/data/poster/sweetlife2345.jpg",
            isMain: 0,
            club_id: 4
        }
    ]);