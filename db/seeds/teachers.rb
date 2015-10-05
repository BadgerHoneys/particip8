teachers = [
    {
        name: 'Jim Kelly',
        email: 'j@kelly.com',
        school_id: 1,
        password: 'topsecret'
    },
    {
        name: 'Tina Antiaq',
        email: 't@antiaq',
        school_id: 1,
        password: 'topsecret'
    },
    {
        name: 'Jenny Smith',
        email: 'j@smith.com',
        school_id: 1,
        password: 'topsecret'
    },
    {
        name: 'Elizabeth Norberg',
        email: 'e@norberg',
        school_id: 1,
        password: 'topsecret'
    },
    {
        name: 'Gerry Thornberg',
        email: 'g@thornberg',
        school_id: 1,
        password: 'topsecret'
    },
    {
        name: 'Michelle Grant',
        email: 'm@grant.com',
        school_id: 1,
        password: 'topsecret'
    }
]

Teacher.delete_all
Teacher.create!(teachers)