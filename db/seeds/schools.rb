schools = [
    {
        name:'Martin Elementary',
        district_id: 1
    },
    {
        name:'Bishop Feehan',
        district_id: 1
    },
    {
        name:'Boston Middle School',
        district_id: 2
    },
    {
        name:'Boston High School',
        district_id: 2
    },
    {
        name:'Rochester Elementary School',
        district_id: 3
    },
    {
        name:'Rochester Middle School',
        district_id: 3
    },
]
School.delete_all
School.create!(schools)